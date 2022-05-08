import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Example/dependence.dart';

class IndexController extends GetxController {
  var _selectedIndex = 0.obs;
}

class Example5 extends StatelessWidget {
  var a = Get.put(IndexController(), tag: 'a');
  final List<Widget> tabodies = [
    Center(
      child: Icon(
        Icons.info,
        size: 80,
      ),
    ),
    Center(
      child: Icon(
        Icons.widgets,
        size: 80,
      ),
    ),
    Center(
      child: Icon(
        Icons.devices_other_rounded,
        size: 80,
      ),
    ),
    Center(
      child: Icon(
        Icons.home,
        size: 80,
      ),
    ),
  ];
  void _onTapped(int index) {
    a._selectedIndex.value = index;
  }

  @override
  Widget build(context) {
    return Scaffold(
      // 使用Obx(()=>每当改变计数时，就更新Text()。
      appBar: AppBar(title: Text('Tabitem切换')),
      body: Obx(
        () => IndexedStack(
          index: a._selectedIndex.value,
          children: tabodies,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              backgroundColor: Colors.black38,
              label: '1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.widgets),
              backgroundColor: Colors.black38,
              label: '2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.devices_other_rounded),
              backgroundColor: Colors.black38,
              label: '3',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              backgroundColor: Colors.black38,
              label: '4',
            )
          ],
          selectedItemColor: Colors.purpleAccent,
          currentIndex: a._selectedIndex.value,
          iconSize: 34,
          onTap: _onTapped,
        ),
      ),
    );
  }
}
