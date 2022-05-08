import 'dart:async';

import 'package:flutter/material.dart';

import '../r_type_define.dart';
import 'r_manager.dart';

typedef WidgetCallback = Widget Function();

class RWidget extends StatefulWidget {
  const RWidget(this.builder, {Key? key}) : super(key: key);

  final WidgetCallback builder;

  @override
  _RWidget createState() => _RWidget();
}

class _RWidget extends State<RWidget> {
  RManager _rManager = RManager();
  final _observer = RxNotifier();
  late StreamSubscription subs;

  void _updateTree(_) {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    subs = _observer.listen(_updateTree, cancelOnError: false);
    _rManager.usedNotifier.addListener(() {
      if (mounted) setState(() {});
    });
  }

  Widget get notifyChild {
    final observer = RManager.proxy;
    RManager.proxy = _rManager;
    final result = widget.builder();
    if (!_rManager.canUpdate) {
      subs = _observer.listen(_updateTree, cancelOnError: false);
      return RxInterface.notifyChildren(_observer, widget.builder);
    }
    RManager.proxy = observer;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return notifyChild;
  }

  @override
  void dispose() {
    _rManager.usedNotifier.dispose();
    subs.cancel();
    _observer.close();
    super.dispose();
  }
}
