import 'package:flutter/material.dart';
import 'package:patient_app_fit4002/common/utils/utils.dart';
import 'package:patient_app_fit4002/common/values/values.dart';
import 'package:patient_app_fit4002/common/widgets/widgets.dart';
import 'package:pinput/pinput.dart';

class MyVerifyPage extends StatefulWidget {
  const MyVerifyPage({Key? key}) : super(key: key);

  @override
  State<MyVerifyPage> createState() => _MyVerifyPageState();
}

class _MyVerifyPageState extends State<MyVerifyPage> {
  
  // country code controller
  final TextEditingController _pinputController = TextEditingController();

  // handle OTP
  _handleOTP() async {
    FirebaseUtil().VerifyOTP(_pinputController.text, context);
  }

  @override
  Widget build(BuildContext context) {

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
                'Phone Verification',
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
                'We need to register your phone without getting started!',
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
              margin: EdgeInsets.only(top: duSetHeight(30)),
              child: Pinput(
                length: 6,
                controller: _pinputController,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
            ),

            Container(
              height: 52,
              margin: EdgeInsets.only(top: duSetHeight(42)),
              child: MaterialButton(
                onPressed: _handleOTP,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0)),
                color: const Color.fromRGBO(55, 190, 125, 1.0),
                textColor: AppColors.primaryElementText,
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Edit Phone Number ?",
                      style: TextStyle(color: AppColors.primaryText),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

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
