import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Controllers extends GetxController {
  var author = ''.obs;
}

class FutureController extends GetxController {
  var id = 0.obs;

  Future<void> setInt(int num) async {
    print("here is setInt");
    this.id.value = num;
  }
}

class Example3 extends StatelessWidget {
  List<String> _tags = ['索尼', '任天堂', '微软', '腾讯', '育碧', '卡普空'];
  @override
  Widget build(context) {
    // 使用Get.lazyPut()实例化你的类，使其对当下的所有子路由可用。
    Get.lazyPut(() => Controllers(), tag: "c");
    Get.lazyPut(() => Controllers(), tag: "b");
    Get.put(Controllers(), tag: 'a');

    late int aa;
    Get.putAsync<FutureController>(() async {
      final prefs = FutureController();
      prefs.setInt(100);
      aa = prefs.id.value;
      print('this is :$aa');
      return prefs;
    });

    Future.delayed(Duration(seconds: 1), () {
      FutureController fu = Get.find();
      print(fu.id.value);
    });

    var a = Get.find<Controllers>(tag: 'a');
    var b = Get.find<Controllers>(tag: 'b');
    late Controllers c;

    Future.delayed(Duration(seconds: 3), () {
      c = Get.find(tag: "c");
    });

    return Scaffold(
      // 使用Obx(()=>每当改变计数时，就更新Text()。
      appBar: AppBar(title: Text("实例方法")),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Center(
              child: Text("实例化的方式"),
            ),
          ),
          Container(
            child: Wrap(
              spacing: 8,
              children: _tags.map((tag) {
                return Obx(
                  () => ChoiceChip(
                    label: Text(tag),
                    selected: a.author.value == tag,
                    onSelected: (selected) {
                      a.author.value = tag;
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          Obx(() => Text("Your choice is :${a.author.value}")),
          Divider(
            height: 5,
            color: Colors.black,
          ),
          Container(
            child: Wrap(
              spacing: 8,
              children: _tags.map((tag) {
                return Obx(
                  () => ChoiceChip(
                    label: Text(tag),
                    selected: b.author.value == tag,
                    onSelected: (selected) {
                      b.author.value = tag;
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          Obx(() => Text("Your choice is :${b.author.value}")),
        ],
      ),
    );
  }
}
