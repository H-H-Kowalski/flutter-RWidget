// import 'dart:collection';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_picker/flutter_picker.dart';
// import 'package:provider/provider.dart';
// import 'PickerData.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'compat.dart';
//
// void main() => runApp(MyApp());

//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         Provider(create: (context) => CountModel()),
//       ],
//       child: MaterialApp(
//           home: Scaffold(
//         body: Center(
//             child: Column(
//           children: <Widget>[
//             _build(
//                 context,
//                 "1",
//                 CountItemWidget(
//                   content: '',
//                 )),
//             _build(
//                 context,
//                 "1",
//                 CountItemWidget(
//                   content: '',
//                 )),
//             _build(
//                 context,
//                 "222",
//                 CountItemWidget(
//                   content: '',
//                 ))
//           ],
//         )),
//       )),
//     );
//   }
//
//   Widget _build(BuildContext context, String text, Widget newRouteWidget) {
//     return RaisedButton(
//       child: Text(text),
//       onPressed: () => Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => newRouteWidget,
//       )),
//     );
//   }
// }
//
// //首先我们有一个model，做数据处理，ChangeNotifier用到Provider中
// class CountModel extends ChangeNotifier {
//   //key为字母，value为点击次数统计
//   late Map<String, int> contentMap;
//
//   //初始化数据
//   initData() {
//     contentMap["a"] = 0;
//     contentMap["b"] = 0;
//     contentMap["c"] = 0;
//   }
//
//   //增加字母按钮的点击次数
//   increment(String content) {
//     contentMap[content] = (contentMap[content]! + 1);
//     //通知刷新
//     notifyListeners();
//   }
// }
//
// class SelectorDemoWidget extends StatefulWidget {
//   SelectorDemoWidget({required Key key}) : super(key: key);
//
//   @override
//   _SelectorDemoWidgetState createState() => _SelectorDemoWidgetState();
// }
//
// class _SelectorDemoWidgetState extends State<SelectorDemoWidget> {
//   CountModel _model = CountModel();
//
//   @override
//   void initState() {
//     super.initState();
//     //初始化数据
//     _model = new CountModel()..initData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //构建一组字母按钮(CountItemWidget)
//     List<CountItemWidget> _children = _model.contentMap.keys
//         .map((key) => CountItemWidget(content: key))
//         .toList();
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Selector示例"),
//         ),
//         //ChangeNotifierProvider 常用方式
//         body: ChangeNotifierProvider.value(
//           value: _model,
//           child: ListView(children: _children),
//         ));
//   }
// }
//
// //字母按钮
// class CountItemWidget extends StatelessWidget {
//   final String content;
//
//   CountItemWidget({required this.content});
//
//   @override
//   Widget build(BuildContext context) {
//     print("CountItemWidget:build");
//     return Container(
//       height: 80,
//       padding: EdgeInsets.all(15),
//       alignment: Alignment.center,
//       child: RaisedButton(
//         onPressed: () =>
//             Provider.of<CountModel>(context, listen: false).increment(content),
//         child: Selector<CountModel, int?>(
//             //从 CountModel得到对应字母的count
//             selector: (context, model) => (model.contentMap[content]),
//             //如果前后两次的count不相等，则刷新
//             shouldRebuild: (preCount, nextCount) => preCount != nextCount,
//             builder: (context, count, child) {
//               print("$content Selector:builder");
//               return Text("$content : $count");
//             }),
//       ),
//     );
//   }
// }
