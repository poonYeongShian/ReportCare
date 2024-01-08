import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../utils/firebase.dart';

class DailyReportWidget extends StatefulWidget {
  
  final String userId;

  const DailyReportWidget({super.key, required this.userId});

  @override
  State<DailyReportWidget> createState() => _DailyReportWidgetState();
}

class _DailyReportWidgetState extends State<DailyReportWidget> {

  Map<String, dynamic>? userData;
  
  @override
  void initState() {
    super.initState();
    _fetchUserData(); // Fetch user data when the widget is initialized
  }

  Future<void> _fetchUserData() async {
    // Call getUserDataById from FirebaseUtil to retrieve user data
    userData = await FirebaseUtil.getUserDataById(widget.userId);

    // Update the widget's state to trigger a rebuild
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Use userData to populate the text
    String reportText = userData != null
        ? 'BP (sys/dia): ${userData!['details']['bp_sys']}/${userData!['details']['bp_dia']} (125/88)\nHR: ${userData!['details']['HR']} (80)\nPhysical: ${userData!['details']['physical']}/4400(steps)\nLiquid Intake: ${userData!['details']['liquid']}/3700ml\nYour Medication: ${userData!['details']['medication']}'
        : 'Loading...'; // Display "Loading..." while data is being fetched
    
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 1.0),
          bottom: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            elevation: 10,
            clipBehavior: Clip.antiAlias,
            child: Column(children: [
              const ListTile(
                leading: Icon(
                  Icons.done_outline_rounded,
                  color: Colors.green,
                ),
                title: Text('Daily Report'),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    reportText,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
