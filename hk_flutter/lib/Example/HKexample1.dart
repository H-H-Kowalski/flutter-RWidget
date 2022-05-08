import 'package:untitled/hk_Reactive/Reactive_SDK/r_type_define.dart';
import 'package:flutter/material.dart';
import 'HKexample1_2.dart';
import 'dart:math';
import 'package:untitled/hk_Reactive/Reactive_SDK/r_star_score_widget/r_star_widget.dart';

//计数器变化测试
class AA {
  int id;
  int num;
  AA(this.id, this.num);
}

RxInt count1 = 0.obs;
final count2 = 0.obs;

int get sum => count1.value + count2.value;

class Controller {
  var id = 1.obs;
  void increment1() {
    id++;
    count2.value++;
  }
}

class Controller2 {
  var num2 = "10".obs;
  RxString num = '1'.obs;
  void increment2() {
    num2.value += '1';
    count1++;
  }
}

class Controller3 {
  var list1 = [].obs;

  void increment3() {
    list1.add("1");
  }
}

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  _Example createState() => _Example();
}

class _Example extends State<Example> {
  var ratingValue = "1".obs;
  List<Widget> _catSeyHello() {
    List<Widget> list = [];
    for (var i = 0; i < 20; i++) {
      list.add(Container(
        alignment: Alignment.center,
        child: Text('喵', style: TextStyle(color: Colors.white, fontSize: 20)),
        color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
            Random().nextInt(256), 1),
      ));
    }
    return list;
  }

  @override
  Widget build(context) {
    // 使用.put()注册Controller
    Controller c = HKRegister.put(Controller(), tag: "c1");
    Controller2 c2 = HKRegister.put(Controller2(), tag: "c2");
    Controller3 l1 = HKRegister.put(Controller3(), tag: "l1");
    return Scaffold(
        // 使用Obx(()=>每当改变计数时，就更新Text()。
        appBar: AppBar(
          title: Text("计数器"),
        ),
        body: RBindWidget(
          binds: [c, c2, l1],
          tags: ['c1', 'c2', 'l1'],
          child: ListView(
            children: [
              Center(
                child: Text(
                  "全局监听",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              RWidget(
                () {
                  return Text(
                    '${count1.value}  + ${count2.value} = ${sum}',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  );
                },
              ),
              Divider(
                height: 5,
                color: Colors.black,
              ),
              Center(
                child: Text(
                  "监听基本数据类型",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Center(
                child: TextButton(
                    child: RWidget(
                      () => Text(
                        "Go to :${c2.num2}",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Other2()));
                    }),
              ),
              FloatingActionButton(
                onPressed: c2.increment2,
                child: Icon(
                  Icons.add,
                ),
                backgroundColor: Colors.red,
                heroTag: "add_id",
              ),
              Center(child: RWidget(() {
                return TextButton(
                    child: Text(
                      "Go to :${c.id}",
                      style: TextStyle(fontSize: 24),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Other()));
                    });
              })),
              FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => {
                  c.increment1(),
                  if (mounted) {
                    setState(() {}),
                  }
                },
                heroTag: "add_num",
              ),
              Text(
                "测试监听对象",
                style: TextStyle(fontSize: 30),
              ),
              Center(
                child: RWidget(
                  () {
                    return TextButton(
                        child: Text(
                          "Object test :${l1.list1}",
                          style: TextStyle(fontSize: 24),
                        ),
                        onPressed: l1.increment3);
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: SponRatingWidget(
                  value: 9,
                  size: 30,
                  padding: 5,
                  nomalImage:
                      '/Users/haokunhu/Desktop/design/hk_flutter/lib/img/star_nomal.png',
                  selectImage:
                      '/Users/haokunhu/Desktop/design/hk_flutter/lib/img/star.png',
                  selectAble: true,
                  onRatingUpdate: (value) {
                    ratingValue.value = value;
                  },
                  maxRating: 10,
                  count: 6,
                ),
              ),
              Center(
                child: RWidget(() => Text("${ratingValue.value}是您选择的评分")),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: _catSeyHello(),
              )
            ],
          ),
        ));
  }
}
