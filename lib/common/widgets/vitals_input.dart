import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../utils/firebase.dart';

class VitalsInputWidget extends StatefulWidget {
  final String userId;

  const VitalsInputWidget({super.key, required this.userId});

  @override
  State<VitalsInputWidget> createState() => _VitalsInputWidgetState();
}

class _VitalsInputWidgetState extends State<VitalsInputWidget> {
  Map<String, dynamic>? userData;

  final TextEditingController bpSysController = TextEditingController();
  final TextEditingController bpDiaController = TextEditingController();
  final TextEditingController hrController = TextEditingController();
  final TextEditingController physicalController = TextEditingController();
  final TextEditingController liquidController = TextEditingController();
  final TextEditingController medicationController = TextEditingController();

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

  // Function to show a Dialog with a message
  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Status'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  bool _validateInput() {
    List<String> errors = [];

    if (int.tryParse(bpSysController.text) == null) {
      errors.add('Sys BP');
    }

    if (int.tryParse(bpDiaController.text) == null) {
      errors.add('Dia BP');
    }

    if (int.tryParse(hrController.text) == null) {
      errors.add('HR');
    }

    if (int.tryParse(physicalController.text) == null) {
      errors.add('Physical');
    }

    if (int.tryParse(liquidController.text) == null) {
      errors.add('Liquid');
    }

    if (int.tryParse(medicationController.text) == null) {
      errors.add('Medication');
    }

    if (errors.isNotEmpty) {
      _showDialog('Invalid ${errors.join(', ')}');
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {

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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(children: [
                const ListTile(
                  leading: Icon(
                    Icons.add_circle_outline,
                    color: Colors.green,
                    size: 33,
                  ),
                  title: Text('Input Vitals'),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      const Baseline(
                          baseline: 20,
                          baselineType: TextBaseline.alphabetic,
                          child: Text("BP (sys/dia):")),
                      const SizedBox(width: 16),
                      Flexible(
                        child: TextField(
                          controller: bpSysController,
                          decoration: const InputDecoration(labelText: "Sys"),
                          style: const TextStyle(fontSize: 14),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        child: TextField(
                          controller: bpDiaController,
                          decoration: const InputDecoration(labelText: "Dia"),
                          style: const TextStyle(fontSize: 14),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      const Baseline(
                          baseline: 20,
                          baselineType: TextBaseline.alphabetic,
                          child: Text("HR:")),
                      const SizedBox(width: 16),
                      Flexible(
                        child: TextField(
                          controller: hrController,
                          keyboardType: TextInputType.number,
                          style:
                              const TextStyle(fontSize: 14), // Adjust the font size
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      const Baseline(
                          baseline: 20,
                          baselineType: TextBaseline.alphabetic,
                          child: Text("Physical:")),
                      const SizedBox(width: 16),
                      Flexible(
                        child: TextField(
                          controller: physicalController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      const Baseline(
                          baseline: 20,
                          baselineType: TextBaseline.alphabetic,
                          child: Text("Liquid:")),
                      const SizedBox(width: 16),
                      Flexible(
                        child: TextField(
                          controller: liquidController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      const Text("Medication:"),
                      const SizedBox(width: 16),
                      Flexible(
                        child: TextField(
                          controller: medicationController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      // Validate input and proceed with updating data if valid
                      if (_validateInput()) {
                        final userData = {
                          'bp_sys': int.tryParse(bpSysController.text),
                          'bp_dia': int.tryParse(bpDiaController.text),
                          'HR': int.tryParse(hrController.text),
                          'physical': int.tryParse(physicalController.text),
                          'liquid': int.tryParse(liquidController.text),
                          'medication': int.tryParse(medicationController.text),
                        };

                        try {
                          await FirebaseUtil.updateUserData(
                              widget.userId, userData);
                          // Show a success message in a Dialog
                          _showDialog('User data updated successfully');
                        } catch (e) {
                          // TODO: Use a logcat equivalent instead
                          print('Error updating user data: $e');
                          // Show an error message in a Dialog
                          _showDialog('Error updating user data');
                        }
                      }
                    },
                    child: const Text("Submit"),
                  ),
                )
              ]),
            )),
      ),
    );
  }
}
