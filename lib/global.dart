import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:patient_app_fit4002/common/utils/utils.dart';
import 'package:patient_app_fit4002/common/values/values.dart';



/// 全局配置
class Global {

  /// 是否第一次打开
  static bool isFirstOpen = false;

  /// 是否离线登录
  static bool isOfflineLogin = false;

  /// 是否 release
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  /// init
  static Future init() async {

    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    // initialize firebase
    await FirebaseUtil.init();

    // initialize tools
    await StorageUtil.init();

    // First time open the app
    isFirstOpen = !StorageUtil().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY);
    if (isFirstOpen) {
      StorageUtil().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    }

  }
}
