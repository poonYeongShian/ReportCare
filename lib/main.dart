import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app_fit4002/common/values/values.dart';
import 'package:patient_app_fit4002/pages/index/index.dart';
import 'package:patient_app_fit4002/routes.dart';
import 'global.dart';


// initialise all the variable include firebase in global before run app
void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 812 - 44 - 34),
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: primary
            ),
            debugShowCheckedModeBanner: false,
            title: 'Patient App',
            routes: staticRoutes,
            home: IndexPage(),
          );
        });
  }
}

