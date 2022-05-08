// import 'dart:math';
//
// import 'package:annotation_route/annotation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_picker/Picker.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:photo_manager/photo_manager.dart';
// import 'package:text_span_field/text_span_builder.dart';
// import 'package:upup/manager/circle/circle_publish_manager.dart';
// import 'package:upup/manager/lifecycle_manager.dart';
// import 'package:upup/manager/navigation_manager.dart';
// import 'package:upup/manager/proto_manager.dart';
// import 'package:upup/manager/track_manager.dart';
// import 'package:upup/pages/circle/widgets/activity_info_edit_widget.dart';
// import 'package:upup/pages/circle/widgets/circle_tag_widget.dart';
// import 'package:upup/pages/circle/widgets/commit_button_widget.dart';
// import 'package:upup/pages/circle/widgets/tag_text_field_widget.dart';
// import 'package:upup/pages/common/up_color.dart';
// import 'package:upup/pages/planet/publish/publish_manager.dart';
// import 'package:upup/pages/planet/publish/simple_rich_edit_controller.dart';
// import 'package:upup/pages/routers/page_base.dart';
// import 'package:upup/player/util/time_util.dart';
// import 'package:upup/proto/guard_circle.pb.dart';
// import 'package:upup/proto/guard_list.pb.dart';
// import 'package:upup/proto/guardcomm.pb.dart';
// import 'package:upup/utils/circle_util.dart';
// import 'package:upup/utils/common_util.dart';
// import 'package:upup/utils/compat_util.dart';
// import 'package:upup/utils/proto_util.dart';
// import 'package:upup/utils/ui_util.dart';
// import 'package:upup/utils/video_util.dart';
// import 'package:upup/widgets/custom_text.dart';
// import 'package:wechat_assets_picker/wechat_assets_picker.dart';
// import 'package:wechat_camera_picker/wechat_camera_picker.dart';
//
// /// 创建挑战页面
// /// currentCircle 默认的标签选择
// /// activityId 活动ID
// /// submitType 活动上传信息配置
// /// uploadTip 活动的tip弹窗文本
// /// 说明一下各参数对发布页面的影响:
// /// 1. 配置了activityId或者 currentCircle 不显示标签选择
// /// 2. 配置了activityId且submitType为1, 则显示学校/个人信息填报, 且显示uploadTip
// /// 3. 配置了activityId且submitType为0, 则不显示学校/个人信息填报
//
// @RouteDefine('ChallengePublishPage')
// bool submit=false;
// class ChallengePublishPage extends PageBase {
//   final bool isEdit;
//   final ChallengeInfo info;
//
//   ChallengePublishPage(String routeName, Map<String, Object> routeArguments)
//       : this.isEdit = cast(routeArguments != null ? routeArguments['isEdit'] ?? false : false),
//         this.info = cast(routeArguments != null ? routeArguments['info'] : null),
//         super(routeName, routeArguments);
//
//   @override
//   _ChallengePublishPage createState() => _ChallengePublishPage();
// }
//
// class _ChallengePublishPage extends State<ChallengePublishPage> {
//   AssetEntity assets;
//   TextEditingController _titleController;
//   TextEditingController _descController;
//   String disabledReason;
//
//   final double listSpec = 4.0;
//
//   String stateText = "创建新的挑战";
//   String selectedUnit="选择单位";
//   String selectedTime="选择时长";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color(0xFFF3F3F4),
//         appBar: getCommonAppBar(
//           '发布作品',
//           onPressed: getOnBackPressed(context),
//           actions: [
//             CommitButtonWidget('发布', disabledReason == null, onPublishChallenge),
//             SizedBox(width: compat(16)),
//           ],
//         ),
//         body: Container(
//             child:Column(
//               children: [
//                 SizedBox(height: compat(12)),
//                 Container(
//                   color: Color(0xFFFFFFFF),
//                   height: compat(344),
//                   child: Column(
//                     children: [
//                       InputChallengeTitle(_titleController),
//                       InputChallengeDesc(_descController),
//                       selectChallengeUnit(),
//                       selectChallengeTime(),
//                       selectChallengeIcon(),
//                     ],
//                   ),
//                 )
//
//               ],
//             )
//         )
//     );
//   }
//   String icon="";
//   Widget selectChallengeUnit(){
//     return  Container(
//       height: compat(56),
//       decoration: BoxDecoration(
//           border: Border(
//               bottom: BorderSide(
//                   width:0.5,
//                   color: Color(0xFFF3F3F4)
//               )
//           )
//       ),
//       child: Row(
//         children: [
//           SizedBox(width: compat(16),),
//           SizedBox(child: Text(
//               "挑战周期",
//               style: TextStyle(fontSize: compat(16))),
//             //width: compat(64)
//           ),
//           SizedBox(width: compat(32),),
//           SizedBox(
//             width: compat(112),
//             child: Text(
//               "${selectedUnit}",
//               style: TextStyle(
//                   fontSize: compat(16),
//                   color:(selectedUnit=="选择单位")? Color(0xFFBFBEBE):Color(0xFF2C2929)),),
//           ),
//           SizedBox(width: compat(119)),
//           GestureDetector(
//               child: Container(
//                 width: compat(16),
//                 child: Icon(Icons.arrow_forward_ios_rounded,color: Color(0xFFBFBEBE),size: compat(16),),
//               ),
//               onTap: (){
//                 showUnitModal(context);
//               }
//           ),
//         ], //SizedBox(width: 30,),
//       ),
//     );
//   }
//
//   Widget selectChallengeTime(){
//     return Container(
//       height: compat(56),
//       decoration: BoxDecoration(
//           border: Border(
//               bottom: BorderSide(
//                   width:0.5,
//                   color: Color(0xFFF3F3F4)
//               )
//           )
//       ),
//       child: Row(
//         children: [
//           SizedBox(width: compat(112),),
//           SizedBox(
//             width: compat(112),
//             child: Text(
//               "${selectedTime}",
//               style: TextStyle(
//                   fontSize: compat(16),
//                   color:(selectedTime=="选择时长")? Color(0xFFBFBEBE):Colors.black),),
//           ),
//           SizedBox(width: compat(119)),
//           GestureDetector(
//               child: Container(
//                 width: compat(16),
//                 child: Icon(Icons.arrow_forward_ios_rounded,color: Color(0xFFBFBEBE),size: compat(16),),
//               ),
//               onTap: (){
//                 showTimeModal(context);
//               }
//           ),
//         ], //SizedBox(width: 30,),
//       ),
//     );
//   }
//
//   Widget selectChallengeIcon(){
//     return Container(
//       height: compat(56),
//       child:  Row(
//         children: [
//           SizedBox(width: compat(16),),
//           SizedBox(child: Text(
//             "挑战图标",
//             style: TextStyle(fontSize: compat(16)),)
//           ),
//           SizedBox(width: compat(32),),
//           SizedBox(
//             width: compat(112),
//             child: Text(
//               "有图更受欢迎",
//               style: TextStyle(
//                   fontSize: compat(16),
//                   color:(icon=="")? Color(0xFFBFBEBE):Colors.black),),
//           ),
//           SizedBox(width: compat(119)),
//           GestureDetector(
//               child: Container(
//                 width: compat(16),
//                 child: Icon(Icons.arrow_forward_ios_rounded,color: Color(0xFFBFBEBE),size: compat(16),),
//               ),
//               onTap: (){
//                 getImageResourceWidget();
//               }
//           ),
//         ], //SizedBox(width: 30,),
//       ),
//     );
//   }
//
//   void onPublishChallenge() async {
//     if (disabledReason != null) {
//       Fluttertoast.showToast(gravity: ToastGravity.CENTER, msg: disabledReason);
//       return;
//     }
//     // PublishTask(assets).doPublish(
//     //     title: getTextExcludeTags(textSpanBuilder),
//     //     tags: getTagsFromTextSpanField(textSpanBuilder),
//     //     activityInfo: activityInfo);
//
//     Navigator.of(context).pop(true);
//   }
//
//
//   Map<String,String>mapUnit={"0":"1", "1":"7"};
//   Map<String,String>mapTimeDay={
//     "0":"3", "1":"7", "2":"21", "3":"28", "4":"90", "5":"180", "6":"360"
//   };
//   Map<String,String>mapTimeWeek={"0":"4", "1":"6", "2":"12", "3":"16", "4":"32",};
//
//   List<String> pickerUnitData=["每天","每周"];
//   List<String> pickerTimeData0=["3天", "7天", "21天", "28天", "90天", "180天", "360天"];
//   List<String> pickerTimeData1=["4周", "8周", "12周", "16周", "32周"];
//
//
//   showUnitModal(BuildContext context) async {
//     final result = await Picker(
//         adapter: PickerDataAdapter<String>(pickerdata: pickerUnitData),
//         changeToFirst: true,
//         hideHeader: false,
//         selectedTextStyle: TextStyle(color: Colors.blue),
//         onConfirm: (picker, value) {
//           print(value);
//           selectedUnit=pickerUnitData[value[0]];
//         }
//     ).showModal(this.context); //_sca
//     print("result: $result");// ffoldKey.currentState);
//     print("${selectedUnit},${selectedTime}");
//     super.setState(() {
//     });
//   }
//
//   showTimeModal(BuildContext context) async {
//     if(!pickerUnitData.contains(selectedUnit)){
//       Fluttertoast.showToast(msg: '请先选择发表频次', gravity: ToastGravity.CENTER);
//       return false;
//     }
//     final result = await Picker(
//         adapter: PickerDataAdapter<String>(pickerdata: pickerUnitData),
//         changeToFirst: true,
//         hideHeader: false,
//         selectedTextStyle: TextStyle(color: Colors.blue),
//         onConfirm: (picker, value) {
//           print(value.toString());
//           selectedUnit=mapUnit[value[0]];
//           if(selectedUnit=="每周"){
//             selectedTime=mapTimeWeek[value[0]];
//           }
//           else {
//             selectedTime=mapTimeDay[value[0]];
//           }
//         }
//     ).showModal(this.context); //_sca
//     print("result: $result");// ffoldKey.currentState);
//     print("${selectedUnit},${selectedTime}");
//     super.setState(() {
//     });
//   }
//
//   Widget getImageResourceWidget() {
//     return GridView.builder(
//       shrinkWrap: true,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         childAspectRatio: 1,
//         mainAxisSpacing: compat(12),
//         crossAxisSpacing: compat(12),
//       ),
//       itemCount: 1,
//       itemBuilder: (context, index) {
//         if (index == 1) {
//           return GestureDetector(
//             behavior: HitTestBehavior.opaque,
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(width: 1, color: UpColors.grayItemBgColor),
//                 borderRadius: BorderRadius.circular(compat(12)),
//               ),
//               child: Icon(Icons.add,
//                   size: compat(30), color: UpColors.thirdTextColor),
//             ),
//           );
//         } else {
//           return Container(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(compat(12)),
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: [
//                   Image(
//                     width: double.infinity,
//                     height: double.infinity,
//                     image: AssetEntityImageProvider(
//                       assets,
//                       isOriginal: false,
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }
//       },
//       physics: NeverScrollableScrollPhysics(),
//     );
//   }
// }
//
//
// class InputChallengeTitle extends StatelessWidget{
//   final TextEditingController _titleController;
//   const InputChallengeTitle(
//       this._titleController,);
//   @override
//   Widget build(BuildContext context){
//     return  Container(
//       height: compat(56),
//       decoration: BoxDecoration(
//           border: Border(
//               bottom: BorderSide(
//                   width:0.5,
//                   color: Color(0xFFF3F3F4)
//               )
//           )
//       ),
//       child: Row(
//         children: [
//           SizedBox(width: compat(16),),
//           SizedBox(
//             child: Text(
//               "挑战名称",
//               style: TextStyle(fontSize: compat(16),),),
//           ),
//           SizedBox(width: compat(32),),
//           SizedBox(
//             width: compat(247),
//             child:TextField(
//               controller: _titleController,
//               maxLength: 12,
//               style: TextStyle(
//                   fontSize: compat(16)
//               ),
//               decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: "起个名字吧（限制12字）",
//                   hintStyle: TextStyle(
//                     fontFamily: "PingFangSC-Regular",
//                     color:submit==false?Color(0xFFBFBEBE):Color(0xFFFF5858),
//                   ),
//                   counterText: ""
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
//
// class InputChallengeDesc extends StatelessWidget{
//   final TextEditingController textEditController;
//   const InputChallengeDesc(
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
//         children: [
//           SizedBox(width: compat(16),),
//           Container(
//             height: compat(95),
//             alignment: Alignment.topLeft,
//             child: Text(
//               "简介",
//               style: TextStyle(fontSize: compat(16)),),
//             width: compat(64),
//           ),
//           SizedBox(width: compat(32),),
//           SizedBox(
//             width: compat(247),
//             child: TextField(
//               controller: textEditController,
//               style: TextStyle(
//                   fontSize: compat(16)
//               ),
//               maxLines: 6,
//               maxLength: 100,
//               decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: "简单介绍一下吧（限制100个字）",
//                   hintStyle: TextStyle(color:submit==false?Color(0xFFBFBEBE):Color(0xFFFF5858),),
//                   counterText: ""
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
