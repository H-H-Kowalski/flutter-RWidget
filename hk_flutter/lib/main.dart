import 'package:flutter/material.dart';
import 'Example/dependence.dart';
import '/hk_Reactive/Reactive_SDK/r_toast_widget/bot_toast.dart';
void main() => runApp(
      MaterialApp(
        builder: BotToastInit(),
        home: MyApp(),
        navigatorObservers: [BotToastNavigatorObserver()],
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[50],
        body: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "演示demo",
                    style: TextStyle(
                        color: Colors.white, fontSize: 48, fontFamily: "Times"),
                  ),
                  Icon(
                    Icons.devices_other_rounded,
                    size: 80,
                    color: Colors.lightBlueAccent,
                  ),
                ],
              ),
              height: 350,
              width: MediaQuery.of(context).size.width,
              color: Colors.deepPurple,
            ),
            Positioned(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                ),
                children: [
                  SizedBox(),
                  SizedBox(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Dependence(),
                          ),
                      );
                    },
                    child: Card(
                      color: Colors.pinkAccent,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Icon(
                            Icons.account_balance_sharp,
                            size: 50,
                            color: Colors.indigo,
                          ),
                          SizedBox(height: 20),
                          Text(
                            '状态管理',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
