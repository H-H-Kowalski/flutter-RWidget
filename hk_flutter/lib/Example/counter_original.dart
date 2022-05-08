// import 'package:get/get.dart';
import 'package:untitled/hk_Reactive/Reactive_SDK/r_toast_widget/bot_toast_init.dart';
import 'package:untitled/hk_Reactive/Reactive_SDK/r_type_define.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:untitled/hk_Reactive/Reactive_SDK/r_toast_widget/bot_toast.dart';
import 'package:untitled/hk_Reactive/Reactive_SDK/r_star_score_widget/r_star_widget.dart';

//计数器变化测试
class Counter_ori extends StatefulWidget {
  const Counter_ori({Key? key}) : super(key: key);

  final String title = '原生计数器';

  @override
  State<Counter_ori> createState() => _Counter();
}

class _Counter extends State<Counter_ori> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
