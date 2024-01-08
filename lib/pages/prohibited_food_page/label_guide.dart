import 'package:flutter/material.dart';
import 'package:patient_app_fit4002/common/utils/utils.dart';
import 'package:patient_app_fit4002/common/values/values.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// TO DO: REFACTOR
class LabelGuidePage extends StatefulWidget {
  const LabelGuidePage ({super.key});

  @override
  State<LabelGuidePage> createState() => _LabelGuidePageState();
}

class _LabelGuidePageState extends State<LabelGuidePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
          MediaQuery.of(context).orientation == Orientation.portrait
              ? Size.fromHeight(duSetHeight(42))
              : Size.fromHeight(duSetHeight(96)),
          child: AppBar(
              title: const Text(
                  'Food Labels',
                  style: TextStyle(
                      color: AppColors.primaryElementText,
                      fontFamily: "Righteous",
                      fontWeight: FontWeight.normal,
                      fontSize: 24
                  )
              ),
              centerTitle: true
          ),
        ),
        //Loads the pdf file for the user to view.
        body: SfPdfViewer.asset('assets/documents/NutritionLabelInfographicENG.pdf')
    );
  }
}
