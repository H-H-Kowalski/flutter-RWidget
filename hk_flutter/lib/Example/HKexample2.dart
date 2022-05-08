import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Controller extends GetxController {
  var author = ''.obs;
}

class Example2 extends StatelessWidget {
  List<String> _tags = ['索尼', '任天堂', '腾讯', '育碧', '卡普空'];
  @override
  Widget build(context) {
    // 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
    final Controller c = Get.put(Controller());

    return Scaffold(
      // 使用Obx(()=>每当改变计数时，就更新Text()。
      appBar: AppBar(title: Text("选择器监听")),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Center(
              child: Text("测试重建的Widget"),
            ),
          ),
          Container(
            child: Wrap(
              spacing: 8,
              children: _tags.map((tag) {
                return Obx(
                  () => ChoiceChip(
                    label: Text(tag),
                    selected: c.author.value == tag,
                    onSelected: (selected) {
                      c.author.value = tag;
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            child: Wrap(
              spacing: 8,
              children: _tags.map((tag) {
                return ChoiceChip(
                  label: Text(tag),
                  selected: c.author.value == tag,
                  onSelected: (selected) {
                    c.author.value = tag;
                  },
                );
              }).toList(),
            ),
          ),
          Obx(() => Text("Your choice is :${c.author.value}")),
        ],
      ),
    );
  }
}
