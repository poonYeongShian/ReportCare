import 'package:flutter/material.dart';
import 'package:patient_app_fit4002/common/values/values.dart';


/// 透明背景 AppBar
Widget transparentAppBar({
  required BuildContext context,
  Widget? title,
  Widget? leading,
  List<Widget>? actions,
  bool hasLeading = false,
}) {
  return AppBar(
    // remove leading
    automaticallyImplyLeading: hasLeading,

    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Center(
      child: title,
    ),
    leading: leading,
    actions: actions,
  );
}

Widget AppBarVer2({
  required BuildContext context,
  Widget? title,
  Widget? leading,
  List<Widget>? actions,
  bool hasLeading = false,
}){
  return AppBar(
          title: const Text(
            'ReportCare',
            style: TextStyle(
                color: AppColors.primaryElementText,
                fontFamily: "Righteous",
                fontWeight: FontWeight.normal,
                fontSize: 24),
          ),
          centerTitle: true,
        );
}



