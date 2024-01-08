import 'package:flutter/material.dart';
import 'package:patient_app_fit4002/common/utils/utils.dart';
import 'package:patient_app_fit4002/common/values/values.dart';
import 'package:patient_app_fit4002/common/widgets/widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // controller
  final TextEditingController _countryController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();


  // handle Sign in
  _handleSignIn() async {

    FirebaseUtil().smsVerify(_countryController.text.trim() + _phoneNumberController.text.trim(), context);

    Navigator.pushNamed(context, '/verify');
  }

    @override
    void initState() {
      _countryController.text = "+60";
      super.initState();
    }
  ///------------------------------------------------------------------------

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
              'Sign In',
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
              'Welcome to ReportCare! Our secure phone sign-in gets you quick access to your account and all our features.',
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
            height: 55,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 40,
                  child: TextField(
                    controller: _countryController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Text(
                  "|",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: duSetFontSize(33),
                    
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Phone",
                    ),
                  ),
                )
              ],
            ),
          ),

          Container(
            height: 52,
            margin: EdgeInsets.only(top: duSetHeight(42)),
            child: MaterialButton(
              onPressed: _handleSignIn,
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
      appBar: PreferredSize(
        preferredSize:
            MediaQuery.of(context).orientation == Orientation.portrait
                ? Size.fromHeight(duSetHeight(42))
                : Size.fromHeight(duSetHeight(96)),
        child: AppBarVer2(context: context),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              buildLogo(),
              _label(),
              _confirm(),
            ],
          ),
        ),
      ),
    );
  }
}
