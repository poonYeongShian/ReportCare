import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:patient_app_fit4002/common/widgets/widgets.dart';
import 'package:patient_app_fit4002/firebase_options.dart';
import 'package:patient_app_fit4002/global.dart';

class FirebaseUtil {
  static FirebaseUtil _instance = FirebaseUtil._();
  factory FirebaseUtil() => _instance;

  // Declared Firebase Auth and FireStore
  static FirebaseAuth? _auth;
  static FirebaseFirestore? _firestore;

  // Declared OTP token
  static String _verify ="";

  FirebaseUtil._();

  static Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Firebase instance
    _auth ??= FirebaseAuth.instance;

    // Firestore instance
    _firestore ??= FirebaseFirestore.instance;
  }

  static Stream<User?>? authStateChangesStream() {
    return _auth?.authStateChanges();
  }

  /// -------------------------Firebase function down here------------------------------------------
  /// Example of code usage:
  ///   <<Sign Up with firebase Util>>
  ///     FirebaseUtil().signUp("heheboi123@gmail.com", "test123456");
  ///
  ///   <<Sign In with firebase Util>>
  ///     FirebaseUtil().signIn("heheboi123@gmail.com", "test123456");
  ///
  ///   <<Sign Out with firebase Util>>
  ///     FirebaseUtil().signOut();
  ///
  ///   <<Reset Password with email using firebase Util>>
  ///     FirebaseUtil().resetPasswordUsingEmail("heheboi123@gmail.com");

  // Firebase Sign In Email
  Future<void> signInEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth!
          .signInWithEmailAndPassword(email: email, password: password);

      //Debug msg
      print('User signed in: ${userCredential.user?.uid}');

    } catch (e) {
      // Error message
      toastInfo(msg: 'Sign in fail, please enter correct email or password');
    }
  }

  // Firebase Sign In Username
  Future<void> signInUsername(String username, String password) async {
    try {
      //Getting the email value from firestore using the user's username.
      var docRef = FirebaseFirestore.instance.collection("users").doc(username);
      var docSnap = await docRef.get();
      var email = docSnap.get('email');

      UserCredential userCredential = await _auth!
          .signInWithEmailAndPassword(email: email, password: password);

      //Debug msg
      print('User signed in: ${userCredential.user?.uid}');
    } catch (e) {
      // Error message
      toastInfo(msg: 'Sign in fail, please enter correct username or password');
    }
  }

  // Firebase Sign Out
  Future<void> signOut() async {
    try {
      await _auth!.signOut();

      print("user successfully sign out");
    } catch (e) {
      // Error message
      toastInfo(msg: 'fail to sign out');
    }
  }

  // Firebase Sign Up
  Future<void> signUp(String email, String password, String username) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Get the user's UID from the UserCredential
      String uid = userCredential.user!.uid;

      //Sending the email and username values to firestore and initial health stats.
      var data = {
        'username': username,
        'email': email,
        'bp_sys': 0,
        'bp_dia': 0,
        'HR': 0,
        'physical': 0,
        'liquid': 0,
        'medication': 0
      };
      var docRef = FirebaseFirestore.instance.collection("users").doc(username);
      var docSnap = await docRef.get();

      //An error is created if the username already exists.
      if (docSnap.exists) {
        toastInfo(msg: 'Username already exists!');
      } else {
        FirebaseFirestore.instance.collection('users').doc(uid).set({'details': data});
        //toast msg
        toastInfo(msg: 'Sign Up Success!');
      }
    } catch (e) {
      //toast msg
      toastInfo(msg: 'Sign Up fail, try to enter correct input format');
    }
  }

  // Firebase Reset Email Password
  Future<void> resetPasswordUsingEmail(String email) async {
    try {
      await _auth!.sendPasswordResetEmail(email: email);
      // msg
      print('Check Your Inbox to reset password!');
    } catch (e) {
      // Error message
      toastInfo(msg: 'fail to send reset email, please try again');
    }
  }

  // Check user is login or not
  Future<bool> isUserLogin() async {
    return _auth?.currentUser?.uid != null;
  }

  static User? getCurrentUser() {
    return _auth?.currentUser;
  }

  static Future<Map<String, dynamic>?> getUserDataById(String userId) async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userDoc.exists) {
        var userData = userDoc.data();
        if (userData != null) {
          return userData as Map<String, dynamic>;
        } else {
          toastInfo(msg: 'User data is null.');
          return null;
        }
      } else {
        toastInfo(msg: 'User document not found.');
        return null;
      }
    } catch (e) {
      toastInfo(msg: e.toString());
      return null;
    }
  }

  // sms verification
  Future<void> smsVerify(String phone, BuildContext context) async {
    try {
      await _auth!.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          toastInfo(msg: e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          // pass the OTP code to global
          // Global.verify = verificationId;
          _verify = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      print('OTP sent');
    } catch (e) {
      // Error message
      toastInfo(msg: 'OTP failed to send');
    }
  }

  // sms verification
  Future<void> VerifyOTP(String code, BuildContext context) async {

    try {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verify, smsCode: code);
        // Sign the user in (or link) with the credential
        await _auth!.signInWithCredential(credential).then((cred) => {
          getUserInfo(cred.user!.uid)
        }
      );

      Navigator.pushNamedAndRemoveUntil(context, "/app", (route) => false);

      print('OTP verify successfully, Log into the user account...');
    } catch (e) {
      // Error message
      toastInfo(msg: 'OTP incorrect');
    }
  }

  Future<void> getUserInfo(String uid) async {
    final userInfoSchema = {"role" : "client"};

    try {
      // get user role from firebase, if no role then create one
      DocumentSnapshot userSnapshot =
          await _firestore!.collection('users').doc(uid).get();

      if (userSnapshot.exists) {
        // TO DO: Future implementation--> after decide user data schema
        print("Success fetching user data from firestore");
      
      }else{
        _firestore!.collection("users").doc(uid).set(userInfoSchema, SetOptions(merge: true));

        print("No user data, creating one for you");
      }
    } catch(e){
      // Error message
      toastInfo(msg: 'Unable to fetch user data');

    }
  }

  // TODO: This can be updated so that the parameter type is not a Map<String, dynamic>, but a strongly-typed object with optional constructor parameters
  static Future<void> updateUserData(String userId, Map<String, dynamic> newData) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'details': newData});
    } catch (e) {
      print('Error updating user data: $e');
      // You might want to handle errors here, e.g., show an error message.
    }
  }
  
}
