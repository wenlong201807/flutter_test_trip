import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// 通用组件，抽离公共组件使用
class NavigatorUtil {
  ///跳转到指定页面
  static push(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
