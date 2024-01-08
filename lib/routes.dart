import 'package:patient_app_fit4002/pages/application.dart/application.dart';
import 'package:patient_app_fit4002/pages/food/guide.dart';
import 'package:patient_app_fit4002/pages/food/recommended_food.dart';
import 'package:patient_app_fit4002/pages/prohibited_food_page/prohibited_food.dart';
import 'package:patient_app_fit4002/pages/sign_in/sign_in.dart';
import 'package:patient_app_fit4002/pages/sign_in/sign_in.dart';
import 'package:patient_app_fit4002/pages/verify_sms/verify_sms.dart';
import 'package:patient_app_fit4002/pages/prohibited_food_page/label_guide.dart';

///Static routing
var staticRoutes = {
  "/sign_in": (context) => SignInPage(), // sign in page
  "/app": (context) => ApplicationPage(), // main application
  "/verify": (context) => MyVerifyPage(), // otp page
  "/recommended_food": (context) => RecommendedFoodPage(), // recommended food page
  "/guide": (context) => GuidePage(), // recommended food page
  "/prohibited_food": (context) => ProhibitedFoodPage(), // recommended food page
  "/label_guide": (context) => LabelGuidePage(), // prohibited food page

  //TO DO: need to remove
  // "/forgot": (context) => ForgetPassPage(),
};
