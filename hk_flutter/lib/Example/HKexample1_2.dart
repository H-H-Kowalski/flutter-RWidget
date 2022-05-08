import 'package:untitled/hk_Reactive/Reactive_SDK/r_type_define.dart';
import 'HKexample1.dart';
import 'package:flutter/material.dart';

class Other extends StatelessWidget {
  // 你可以让Get找到一个正在被其他页面使用的Controller，并将它返回给你。
  final Controller c = HKRegister.find(tag: "c1");
  @override
  Widget build(context) {
    // 访问更新后的计数变量
    return Scaffold(
        appBar: AppBar(),
        body: RBindWidget(
          binds: [],
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                ),
                SizedBox(
                  child: RWidget(
                    () => Text(
                      "${c.id}",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      c.id++;
                    },
                    child: Text("add")),
              ],
            ),
          ),
        ));
  }
}

class Other2 extends StatelessWidget {
  // 你可以让Get找到一个正在被其他页面使用的Controller，并将它返回给你。
  final Controller2 c = HKRegister.find(tag: "c2");
  @override
  Widget build(context) {
    // 访问更新后的计数变量
    return Scaffold(
        appBar: AppBar(),
        body: RBindWidget(
          binds: [],
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                ),
                SizedBox(
                  child: RWidget(
                    () => Text(
                      "${c.num2}",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      c.increment2();
                    },
                    child: Text("add")),
              ],
            ),
          ),
        ));
  }
}
