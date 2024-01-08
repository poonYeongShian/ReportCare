 import 'package:flutter/material.dart'; 
 import 'package:patient_app_fit4002/common/utils/utils.dart';

  // logo
  Widget buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(35)),
      child: Container(
        width: 300,
        height: 250,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/forgot_password.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }