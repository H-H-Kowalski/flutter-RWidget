import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_stream/rx_stream.dart';

import '../r_notifier/r_notifier.dart';
// 添加/更新监听

class RManager {
  RNotifier usedNotifier = RNotifier();

  Map<RNotifier, String> _listenerMap = {};

  bool get canUpdate => _listenerMap.isNotEmpty;

  static RManager? proxy;

  void addListener(RNotifier notifier) {
    if (!_listenerMap.containsKey(notifier)) {
      //变量监听中刷新
      notifier.addListener(() {
        //刷新RWidget中添加的监听
        usedNotifier.notify();
      });
      //添加监听到map中
      _listenerMap[notifier] = '';
    }
  }
}
