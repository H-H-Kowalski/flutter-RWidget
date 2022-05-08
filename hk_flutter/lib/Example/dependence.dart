import 'package:flutter/material.dart';
import 'HKexample1.dart';
import 'HKexample2.dart';
import 'HKexample3.dart';
import 'HKexample4.dart';
import 'HKexample5.dart';
import 'counter_original.dart';
import 'counter_rwidget.dart';

class Dependence extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("依赖与状态管理"),
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Counter_RW()));
                    },
                    child: GridTile(
                      child: Text(
                        "计数器R-Widget",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                  decoration: ShapeDecoration(
                    color: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                  height: 50,
                  width: 240,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Counter_ori()));
                    },
                    child: GridTile(
                      child: Text(
                        "计数器原生",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                  decoration: ShapeDecoration(
                    color: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                  height: 50,
                  width: 240,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Example()));
                    },
                    child: GridTile(
                      child: Text(
                        "计数器",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                  decoration: ShapeDecoration(
                    color: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                  height: 50,
                  width: 240,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Example5()));
                    },
                    child: GridTile(
                      child: Text(
                        "列表演示",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                  decoration: ShapeDecoration(
                    color: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                  height: 50,
                  width: 240,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Example2()));
                    },
                    child: GridTile(
                      child: Text(
                        "单一选项",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                  decoration: ShapeDecoration(
                    color: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                  height: 50,
                  width: 240,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Example3()));
                    },
                    child: GridTile(
                      child: Text(
                        "单一选项2",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                  decoration: ShapeDecoration(
                    color: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                  height: 50,
                  width: 240,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Example4()));
                    },
                    child: GridTile(
                      child: Text(
                        "slider",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                  decoration: ShapeDecoration(
                    color: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                  height: 50,
                  width: 240,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          )
        ],
      ),
      backgroundColor: Colors.blueGrey,
    );
  }
}
