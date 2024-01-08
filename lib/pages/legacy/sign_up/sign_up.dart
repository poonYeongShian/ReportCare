import 'package:flutter/material.dart';
import 'package:patient_app_fit4002/common/utils/utils.dart';
import 'package:patient_app_fit4002/common/values/values.dart';
import 'package:patient_app_fit4002/common/widgets/widgets.dart';



class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //boolean to enable and disable the password from being displayed.
  bool showPassword = false;
  bool showConfirmPassword = false;

  //valid characters for username
  static final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');

  //User controllers to help get the values from the form fields.
  var userController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController(),
      confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: MediaQuery.of(context).orientation == Orientation.portrait
            ? Size.fromHeight(duSetHeight(42))
            : Size.fromHeight(duSetHeight(96)),
        child: AppBar(
          title: const Text(
            'ReportCare',
            style: TextStyle(
                color: AppColors.primaryElementText,
                fontFamily: "Righteous",
                fontWeight: FontWeight.normal,
                fontSize: 24),
          ),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Align Sign In text and heart icon closer to the top
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      // Sign Up title
                      const Text('Sign Up',
                          textScaleFactor: 2.5,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                          )),
                      // Heart shape logo
                      Image.asset(
                        'assets/images/heart-icon.png',
                        scale: 0.6,
                      ),
                    ],
                  ),
                ),
              ),
              //Creating the form fields.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Form(
                  child: Column(
                    children: [
                      //Username
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: userController,
                        decoration: const InputDecoration(
                            labelText: 'Username',
                            prefixIcon: Icon(Icons.account_circle),
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 30),
                      //Email
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 30),
                      //Password
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        obscureText: !showPassword,
                        //Decides whether the password should be shown.
                        decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              //Change icons based on whether password is displayed or not.
                              icon: Icon(showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              color: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                            )),
                      ),
                      const SizedBox(height: 30),
                      //Confirm Password
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: confirmPasswordController,
                        obscureText: !showConfirmPassword,
                        //Decides whether the password should be shown.
                        decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            prefixIcon: const Icon(Icons.lock),
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              //Change icons based on whether password is displayed or not.
                              icon: Icon(showConfirmPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              color: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  showConfirmPassword = !showConfirmPassword;
                                });
                              },
                            )),
                        validator: (value) {
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              //Sign in button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 105),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 52,
                  //Creates an account based on the values in the form fields.
                  onPressed: () {
                    if (validCharacters.hasMatch(userController.text) &&
                        passwordController.text == confirmPasswordController.text) {
                      FirebaseUtil().signUp(emailController.text,
                          passwordController.text, userController.text);
                    } else {
                      toastInfo(msg: 'Invalid input or passwords do not match.');
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0)),
                  color: const Color.fromRGBO(55, 190, 125, 1.0),
                  textColor: AppColors.primaryElementText,
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}