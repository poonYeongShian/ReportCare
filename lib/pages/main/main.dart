import 'package:flutter/material.dart';
import 'package:patient_app_fit4002/common/utils/utils.dart';

import '../../common/values/values.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  _handleLogout() {
    FirebaseUtil().signOut();
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/sign_in',
      (route) => false,
    );
  }

  //---------------------------------------------------

  Widget _demoBtn() {
    return Container(
      height: 52,
      margin: EdgeInsets.only(top: duSetHeight(42)),
      child: MaterialButton(
        onPressed: _handleLogout,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        color: const Color.fromRGBO(55, 190, 125, 1.0),
        textColor: AppColors.primaryElementText,
        child: const Text(
          'Sign out',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Text('This is a main page'),
        _demoBtn(),
      ]),
    );
  }
}
