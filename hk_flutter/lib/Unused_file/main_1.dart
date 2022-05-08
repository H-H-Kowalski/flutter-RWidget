// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_picker/flutter_picker.dart';
// import 'PickerData.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'compat.dart';
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// final String _fontFamily = Platform.isWindows ? "Roboto" : "";
//
// class _MyAppState extends State<MyApp> {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           fontFamily: _fontFamily,
//           primaryTextTheme: TextTheme().apply(fontFamily: _fontFamily),
//         ),
//
//         home: MyHomePage());
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final double listSpec = 4.0;
//   String? stateText = "创建新的挑战";
//   String? selectedUnit="选择单位";
//   String? selectedTime="选择时长";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color(0xFFF3F3F4),
//         appBar: AppBar(
//           title: Text(' ${stateText}'),
//           automaticallyImplyLeading: false,
//           elevation: 0.0,
//         ),
//         body: Column(
//           children: [
//             SizedBox(
//               height: compat(12),
//             ),
//             Container(
//               height: compat(364),
//               color:Colors.white,
//               padding: EdgeInsets.all(10.0),
//               alignment: Alignment.topCenter,
//               child: ListView(
//                 children: <Widget>[
//                   //SizedBox(height: compat(12),),
//                   Row(
//                     children: [
//                       SizedBox(width: compat(16),),
//                       SizedBox(child: Text(
//                         "挑战名称",
//                         style: TextStyle(fontSize: compat(16)),),
//                         width: compat(64),
//                       ),
//                       SizedBox(width: compat(32),),
//                       Container(
//                         width: compat(247),
//                         alignment: Alignment.topRight,
//                         child: TextField(
//                           maxLength: 12,
//                           style: TextStyle(
//                               fontSize: compat(16)
//                           ),
//                           cursorWidth:1 ,
//                           decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: "起个名字吧（限制12字）",
//                               counterText: ""
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   Divider(color: Colors.grey),
//                   Row(
//                     children: [
//                       SizedBox(width: compat(16),),
//                       Container(
//                         child: Column(
//                           children: [
//                             SizedBox(height: compat(18),),
//                             Container(
//                               alignment: Alignment.topLeft,
//                               child: Text(
//                                 "简介",
//                                 style: TextStyle(fontSize: compat(16)),),
//                             ),
//                             SizedBox(height: compat(82),),
//                           ],
//                         ),
//                         width: compat(64),
//                         //alignment: Alignment,
//                       ),
//                       SizedBox(width: compat(32),),
//                       Container(
//                         width: compat(247),
//                         alignment: Alignment.topRight,
//                         child:
//                         TextField(
//                           style: TextStyle(
//                               fontSize: compat(16)
//                           ),
//                           maxLines: 4,
//                           cursorWidth:1 ,
//                           maxLength: 100,
//                           decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: "简单介绍一下吧（限制100个字）",
//                               counterText: ""
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   Divider(color: Colors.grey),
//                   Row(
//                     children: [
//                       SizedBox(width: compat(16),),
//                       SizedBox(child: Text(
//                         "挑战周期",
//                         style: TextStyle(fontSize: compat(16)),), width: compat(64)),
//                       SizedBox(width: compat(32),),
//                       SizedBox(
//                         width: compat(64),
//                         child: Text(
//                           "${selectedUnit}",
//                           style: TextStyle(
//                               fontSize: compat(16),
//                               color:(selectedUnit=="选择单位")? Colors.grey:Colors.black),),
//                       ),
//                       SizedBox(width: compat(167)),
//                       IconButton(
//                           iconSize: compat(16),
//                           onPressed: () {
//                             showPickerModal(context);
//                           },icon: Icon(Icons.arrow_forward_ios_rounded)),
//                     ], //SizedBox(width: 30,),
//                   ),
//                   Divider(color: Colors.grey),
//                   Row(
//                     children: [
//                       SizedBox(width: compat(112),),
//                       Text(selectedTime!,
//                           style: TextStyle(
//                             fontSize:compat(16),
//                             color:selectedTime=="选择时长"?Colors.grey:Colors.black
//                             ,)),
//                     ],
//                   ),
//                   Divider(color: Colors.grey),
//                   Row(
//                     children: [
//                       SizedBox(width: compat(16),),
//                       SizedBox(child: Text(
//                         "挑战图标",
//                         style: TextStyle(fontSize: compat(16)),), width: compat(64)),
//                       SizedBox(width: compat(32),),
//                       SizedBox(
//                         width: compat(96),
//                         child: Text(
//                           "有图更受欢迎",
//                           style: TextStyle(
//                               fontSize: compat(16),
//                               color:(selectedUnit=="")? Colors.grey:Colors.black),),
//                       ),
//                       SizedBox(width: compat(135)),
//                       IconButton(
//                           iconSize: compat(16),
//                           onPressed: () {
//                             showPickerModal(context);
//                           },icon: Icon(Icons.arrow_forward_ios_rounded)),
//                     ], //SizedBox(width: 30,),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         )
//     );
//   }
//   Map<String,String>mapUnit={
//     "0":"每天",
//     "1":"每周"
//   };
//   Map<String,String>mapTimeDay={
//     "0":"3天",
//     "1":"7天",
//     "2":"21天",
//     "3":"28天",
//     "4":"90天",
//     "5":"180天",
//     "6":"360天"
//   };
//   Map<String,String>mapTimeWeek={
//     "0":"4周",
//     "1":"6周",
//     "2":"12周",
//     "3":"16周",
//     "4":"32周",
//   };
//   showPickerModal(BuildContext context) async {
//     final result = await Picker(
//         adapter: PickerDataAdapter<String>(pickerdata: JsonDecoder().convert(PickerData)),
//         changeToFirst: true,
//         hideHeader: false,
//         selectedTextStyle: TextStyle(color: Colors.blue),
//         onConfirm: (picker, value) {
//           print(value.toString());
//           selectedUnit=mapUnit[value[0].toString()];
//           if(selectedUnit=="每周"){
//             selectedTime=mapTimeWeek[value[1].toString()];
//           }
//           else {
//             selectedTime=mapTimeDay[value[1].toString()];
//           }
//
//         }
//     ).showModal(this.context); //_sca
//     print("result: $result");// ffoldKey.currentState);
//     print("${selectedUnit},${selectedTime}");
//     super.setState(() {
//
//     });
//   }
//
//
// //
// // showPickerUnit(BuildContext context) {
// //   Picker picker = Picker(
// //       adapter: PickerDataAdapter<String>(
// //           pickerdata: JsonDecoder().convert(PickerData2)),
// //       changeToFirst: false,
// //       textAlign: TextAlign.left,
// //       textStyle: TextStyle(color: Colors.blue, fontFamily: _fontFamily),
// //       selectedTextStyle: TextStyle(color: Colors.red),
// //       columnPadding: const EdgeInsets.all(8.0),
// //       onConfirm: (Picker picker, List value) {
// //         print(value.toString());
// //         print(picker.getSelectedValues());
// //         selectedUnit=picker.getSelectedValues().toString();
// //         if(selectedUnit=="每周")
// //         super.setState(() {
// //         });
// //       }
// //   );
// //   picker.showModal(this.context);
// // }
// // showPickerTime(BuildContext context) {
// //   List<dynamic> Pickerdata=[];
// //   if(selectedUnit.toString()=="[每周]"){
// //     Pickerdata=JsonDecoder().convert(PickerData2_1);
// //   }
// //   else if(selectedUnit.toString()=="[每天]"){
// //     Pickerdata=JsonDecoder().convert(PickerData2_2);
// //   }
// //   else {
// //     print(selectedUnit);
// //     return showDialog<bool>(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: Text("提示"),
// //           content: Text("未选择发表频次"),
// //           actions: <Widget>[
// //             FlatButton(
// //               child: Text("取消"),
// //               onPressed: () => Navigator.of(context).pop(), // 关闭对话框
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// //   Picker picker = Picker(
// //       adapter: PickerDataAdapter<String>(
// //           pickerdata: Pickerdata),
// //       changeToFirst: false,
// //       textAlign: TextAlign.left,
// //       textStyle: TextStyle(color: Colors.blue, fontFamily: _fontFamily),
// //       selectedTextStyle: TextStyle(color: Colors.red),
// //       columnPadding: const EdgeInsets.all(8.0),
// //       onConfirm: (Picker picker, List value) {
// //         print(value.toString());
// //         print(picker.getSelectedValues());
// //         selectedTime=picker.getSelectedValues().toString();
// //         super.setState(() {
// //         });
// //       }
// //   );
// //   picker.showModal(this.context);
// // }
// }
//
