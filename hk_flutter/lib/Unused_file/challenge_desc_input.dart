// import '../compat.dart';
// import '../main.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
//
//
// class inputChallengeDes extends StatelessWidget{
//   final TextEditingController textEditController;
//   const inputChallengeDes(
//       this.textEditController,);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: compat(120),
//       decoration: BoxDecoration(
//           border: Border(
//               bottom: BorderSide(
//                   width:0.5,
//                   color: Color(0xFFF3F3F4)
//               )
//           )
//       ),
//       child: Row(
//           children: [
//           SizedBox(width: compat(16),),
//           Container(
//             height: compat(95),
//             alignment: Alignment.topLeft,
//             child: Text(
//             "简介",
//             style: TextStyle(fontSize: compat(16)),),
//             width: compat(64),
//           ),
//           SizedBox(width: compat(32),),
//           SizedBox(
//             width: compat(247),
//             child: TextField(
//               controller: textEditController,
//               style: TextStyle(
//                 fontSize: compat(16)
//               ),
//               maxLines: 6,
//               maxLength: 100,
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: "简单介绍一下吧（限制100个字）",
//                 counterText: ""
//                ),
//             ),
//           )
//           ],
//        ),
//     );
//   }
// }
