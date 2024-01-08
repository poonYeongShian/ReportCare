import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../common/utils/firebase.dart';
import '../../common/widgets/vitals_input.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  
  User? currentUser = FirebaseUtil.getCurrentUser();

  @override
  Widget build(BuildContext context) {
    // TODO: Change how user object is accessed: null checking should not be done at the component level
    return SingleChildScrollView(
      child:  VitalsInputWidget(userId: currentUser!.uid),
    );

  }
}
