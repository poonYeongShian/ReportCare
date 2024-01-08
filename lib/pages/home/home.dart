import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:patient_app_fit4002/common/utils/firebase.dart';
import 'package:patient_app_fit4002/common/widgets/menu_idea.dart';
import 'package:patient_app_fit4002/common/widgets/nutrition_info.dart';

import '../../common/widgets/daily_report.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  User? currentUser = FirebaseUtil.getCurrentUser();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: DailyReportWidget(userId: currentUser!.uid),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: const NutritionInfoWidget(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: const MenuIdeaWidget(),
            ),
          ],
        ),
      ),
    );
  }


}
