import 'package:flutter/material.dart';
import 'package:patient_app_fit4002/common/utils/utils.dart';
import 'package:patient_app_fit4002/common/values/values.dart';

class ForgetPassPage extends StatefulWidget {
  const ForgetPassPage({super.key});

  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
  // email controller
  final TextEditingController _emailController = TextEditingController();

  // handle password reset
  _handleReset() async {
    FirebaseUtil().resetPasswordUsingEmail(_emailController.text.trim());
  }

  ///------------------------------------------------------------------------

  // logo
  Widget _buildLogo() {
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

  // label and description
  Widget _label() {
    return Container(
      width: 310,
      margin: EdgeInsets.only(top: duSetHeight(73)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Forgot\nPassword?',
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: duSetFontSize(24),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: Text(
              'Don’t worry ! It happens. Please enter the email we will send the reset password link in this email.',
              style: TextStyle(
                color: AppColors.secondaryText,
                fontSize: duSetFontSize(14),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }

  // input and continue button
  Widget _confirm() {
    return Container(
      width: 310,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(top: duSetHeight(27)),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.account_circle),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.only(top: duSetHeight(42)),
            child: MaterialButton(
              onPressed: _handleReset,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
              color: const Color.fromRGBO(55, 190, 125, 1.0),
              textColor: AppColors.primaryElementText,
              child: const Text(
                'Continue',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: MediaQuery.of(context).orientation == Orientation.portrait? Size.fromHeight(duSetHeight(42)):Size.fromHeight(duSetHeight(96)),
        child: AppBar(
            title: const Text('ReportCare',
                style: TextStyle(
                    color: AppColors.primaryElementText,
                    fontFamily: "Righteous",
                    fontWeight: FontWeight.normal,
                    fontSize: 24)),
            centerTitle: true),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              _buildLogo(),
              _label(),
              _confirm(),
            ],
          ),
        ),
      ),
    );
  }
}
