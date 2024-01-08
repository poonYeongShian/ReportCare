import 'package:flutter/material.dart';
import 'package:patient_app_fit4002/common/utils/utils.dart';
import 'package:patient_app_fit4002/common/values/values.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

    /// Page header title
  Widget _buildPageHeadTitle() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(80)),
      child: Text(
        "Features",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Montseratt",
          fontWeight: FontWeight.w600,
          fontSize: duSetFontSize(24),
        ),
      ),
    );
  }

    /// Page Header Description
  Widget _buildPageHeaderDetail() {
    return Container(
        width: duSetHeight(242),
        height: duSetHeight(84),
        margin: EdgeInsets.only(top: duSetHeight(14)),
        child: Text(
          'A mobile app that enhances heart failure patient outcomes, preventive care, and health empowerment.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: "Avenir",
            fontWeight: FontWeight.normal,
            fontSize: duSetFontSize(14),
            height: 1.3,
          ),
        ));
  }

  /// Feature Explain
  Widget _buildFeatureItem(String imageName, String intro, double marginTop) {
    return Container(
      width: duSetWidth(295),
      height: duSetHeight(80),
      margin: EdgeInsets.only(top: duSetHeight(marginTop)),
      child: Row(
        children: [
          Container(
            width: duSetWidth(80),
            height: duSetHeight(80),
            child: Image.asset(
              "assets/images/$imageName",
              fit: BoxFit.cover,
            ),
            
          ),
          Spacer(),
          Container(
              width: duSetWidth(195),
              child: Text(
                intro,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.secondaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.normal,
                  fontSize: duSetFontSize(16),
                ),
              ))
        ],
      ),
    );
  }

  /// Sign out button
  Widget _buildStartButton() {
    return Container(
      width: duSetWidth(295),
      height: duSetHeight(44),
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primaryElement,
          shape: RoundedRectangleBorder(
            borderRadius: Radii.k6pxRadius,
          )
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/sign_in");
        },
        child: Text(
          'Get started!',
          style: TextStyle(color: AppColors.primaryElementText),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    //height remove  top, bottom navigation bar
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _buildPageHeadTitle(),
            _buildPageHeaderDetail(),
            _buildFeatureItem(
              "feature_1.jpg",
              "Tracks vitals, diet, alerts doctors, manages medication",
              86,
            ),
            _buildFeatureItem(
              "feature_2.jpg",
              "Reminds, teaches, motivates, always accessible when needed.",
              40,
            ),
            _buildFeatureItem(
              "feature_3.jpg",
              "Guides patients, monitors clinicians, stores records for analytics.",
              40,
            ),
            Spacer(),
            _buildStartButton(),
          ],
        ),
      ),
    );
  }
}
