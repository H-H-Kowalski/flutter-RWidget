// import 'package:get/get.dart';
import 'package:untitled/hk_Reactive/Reactive_SDK/r_type_define.dart';
import 'package:flutter/material.dart';

class Controller {
  var count = 1.obs;
  void increment() {
    count++;
  }
}

//计数器变化测试
class Counter_RW extends StatefulWidget {
  const Counter_RW({Key? key}) : super(key: key);

  final String title = 'R-widget Counter';

  @override
  State<Counter_RW> createState() => _Counter();
}

class _Counter extends State<Counter_RW> {
  @override
  Widget build(BuildContext context) {
    Controller controller = HKRegister.put(Controller(), tag: "counter");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RBindWidget(
        bind: controller,
        tag: 'counter',
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              RWidget(
                () => Text(
                  '${controller.count.value}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
