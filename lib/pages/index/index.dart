import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app_fit4002/common/utils/utils.dart';
import 'package:patient_app_fit4002/global.dart';
import 'package:patient_app_fit4002/pages/application.dart/application.dart';
import 'package:patient_app_fit4002/pages/sign_in/sign_in.dart';
import 'package:patient_app_fit4002/pages/welcome/welcome.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812 - 44 - 34),
    );

    // First open the app? if yes go to --> WelcomePage
    // login and havent sign out? if yes go to--> ApplicationPage
    // login before? if no go to --> SignInPage
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: StreamBuilder<User?>(
        stream: FirebaseUtil.authStateChangesStream(),
        builder: (context, snapshot) {
          if (Global.isFirstOpen == true){
            return WelcomePage();
          }else{
            
            if (snapshot.hasData){
              return ApplicationPage();
            }else{
              return SignInPage();
            }
          }
          
        },
      ),

    );
  }
}
