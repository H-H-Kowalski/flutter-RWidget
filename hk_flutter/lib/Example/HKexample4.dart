import 'package:flutter/material.dart';
import 'package:untitled/Example/dependence.dart';
import 'package:untitled/hk_Reactive/Reactive_SDK/r_notifier/HKRegister.dart';
import 'package:untitled/hk_Reactive/Reactive_SDK/r_type_define.dart';

class RectController {
  var height = (100.5).obs;
  var width = 100.5.obs;
}

class Example4 extends StatelessWidget {
  RectController controller = HKRegister.put(RectController(), tag: 'rect');
  @override
  Widget build(context) {
    return Scaffold(
      // 使用Obx(()=>每当改变计数时，就更新Text()。
      appBar: AppBar(title: Text('实例方法')),
      body: RBindWidget(
        bind: controller,
        tag: 'rect',
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Center(
                    child: Text('设置x'),
                  ),
                ),
                RWidget(
                      () => Slider(
                    value: controller.width.value,
                    onChanged: (data) {
                      controller.width.value = data;
                    },
                    min: 0.0,
                    max: MediaQuery.of(context).size.width - 60,
                    divisions: 200,
                    // label: 'x：${controller.width.value}',
                    activeColor: Colors.green,
                    inactiveColor: Colors.grey,
                    semanticFormatterCallback: (double newValue) {
                      return '${newValue.round()} dollars}';
                    },
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Center(
                    child: Text('设置y'),
                  ),
                ),
                RWidget(
                      () => Slider(
                    value: controller.height.value,
                    onChanged: (data) {
                      controller.height.value = data;
                    },
                    min: 50,
                    max: MediaQuery.of(context).size.height - 150,
                    divisions: 200,
                    // label: 'y：${controller.height.value}',
                    activeColor: Colors.green,
                    inactiveColor: Colors.grey,
                    semanticFormatterCallback: (double newValue) {
                      return '${newValue.round()} dollars}';
                    },
                  ),
                ),
              ],
            ),
            RWidget(() => Positioned(
              left: controller.width.value,
              bottom: controller.height.value,
              child: FloatingActionButton(
                onPressed: () => {},
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
