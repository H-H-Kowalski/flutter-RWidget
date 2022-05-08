// import 'package:annotation_route/annotation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_picker/Picker.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:photo_manager/photo_manager.dart';
// import 'package:upup/manager/lifecycle_manager.dart';
// import 'package:upup/manager/navigation_manager.dart';
// import 'package:upup/manager/proto_manager.dart';
// import 'package:upup/manager/track_manager.dart';
// import 'package:upup/pages/circle/widgets/commit_button_widget.dart';
// import 'package:upup/pages/routers/page_base.dart';
// import 'package:upup/player/util/time_util.dart';
// import 'package:upup/proto/guard_circle.pb.dart';
// import 'package:upup/proto/guard_list.pb.dart';
// import 'package:upup/proto/guardcomm.pb.dart';
// import 'package:upup/utils/circle_util.dart';
// import 'package:upup/utils/common_util.dart';
// import 'package:upup/utils/compat_util.dart';
// import 'package:upup/utils/progress_dialog.dart';
// import 'package:upup/utils/proto_util.dart';
// import 'package:upup/utils/ui_util.dart';
// import 'package:wechat_assets_picker/wechat_assets_picker.dart';
// import 'package:wechat_camera_picker/wechat_camera_picker.dart';
//
// /// 创建挑战页面
// @RouteDefine('challengeCreatePage')
// class ChallengeCreatePage extends PageBase {
//   ChallengeCreatePage(String routeName, Map<String, Object> routeArguments)
//       :super(routeName, routeArguments);
//
//   @override
//   _ChallengeCreatePage createState() => _ChallengeCreatePage();
// }
// ValueNotifier<int> disabledReason = ValueNotifier<int>(0);
// class _ChallengeCreatePage extends State<ChallengeCreatePage> {
//   List<AssetEntity> assets;
//   TextEditingController _titleController;
//   TextEditingController _descController;
//
//   final double listSpec = 4.0;
//   ///需要储存的数据
//   int freqDay=-1,freqCount=-1;String icon="";String title;String desc;
//
//   ///选择项
//   String selectedUnit="选择单位";
//   String selectedTime="选择时长";
//   ///数据转换
//   Map<int,int>mapUnit={0:1, 1:7};
//   Map<int,int>mapTimeDay={0:3, 1:7, 2:21, 3:28, 4:90, 5:180, 6:360};
//   Map<int,int>mapTimeWeek={0:4, 1:8, 2:12, 3:16, 4:32,};
//   ///滚动列表数据
//   List<String> pickerUnitData=["按天","按周"];
//   List<String> pickerTimeDataDay=["3天", "7天", "21天", "28天", "90天", "180天", "360天"];
//   List<String> pickerTimeDataWeek=["4周", "8周", "12周", "16周", "32周"];
//
//   @override
//   void initState() {
//     _titleController =TextEditingController (text:'');
//     _descController =TextEditingController (text:'');
//     disabledReason.value=0;
//     super.initState();
//     disabledReason.addListener(update);
//   }
//
//   ///刷新重建界面
//   void update() {
//     print("disabledReason变化监听回调");
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     _titleController.dispose();
//     _descController.dispose();
//     disabledReason.removeListener(update);
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color(0xFFF3F3F4),
//         appBar: getCommonAppBar(
//           '创建新的挑战',
//           onPressed: getOnBackPressed(context),
//           actions: [
//             CommitButtonWidget('创建', true, onPublishChallenge),
//             SizedBox(width: compat(16)),
//           ],
//         ),
//         body: SingleChildScrollView(
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
//               ],
//             )
//         )
//     );
//   }
//
//   ///选择挑战计数单位
//   Widget selectChallengeUnit(){
//     Widget showChallengeUnit;
//     if(disabledReason.value==0||selectedUnit!="选择单位"){
//       showChallengeUnit=Text(
//         "${selectedUnit}",
//         style: TextStyle(
//             fontSize: compat(16),
//             color:(selectedUnit=="选择单位")? Color(0xFFBFBEBE):Color(0xFF2C2929)),);
//     }
//     else {
//       showChallengeUnit=Text(
//           "这里也不能空着",
//           style: TextStyle(
//               fontSize: compat(16),
//               color:Color(0xFFFF5858)
//           ));
//     }
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
//               width: compat(96)
//           ),
//           SizedBox(
//             width: compat(231),
//             child: showChallengeUnit,
//           ),
//           GestureDetector(
//               child: Container(
//                 width: compat(16),
//                 child: Icon(Icons.arrow_forward_ios,color: Color(0xFFBFBEBE),size: compat(16),),
//               ),
//               onTap: (){
//                 FocusScope.of(context).requestFocus(FocusNode());
//                 showUnitModal(context);
//               }
//           ),
//         ], //SizedBox(width: 30,),
//       ),
//     );
//   }
//
//   ///选择挑战时长
//   Widget selectChallengeTime(){
//     Widget showChallengeTime;
//     if(disabledReason.value == 0||selectedTime!="选择时长"){
//       showChallengeTime=Text(
//           "${selectedTime}",
//           style: TextStyle(
//               fontSize: compat(16),
//               color:(selectedTime=="选择时长")? Color(0xFFBFBEBE):Colors.black)
//       );
//     }
//     else {
//       showChallengeTime=Text(
//           "这里也不能空着",
//           style: TextStyle(
//               fontSize: compat(16),
//               color:Color(0xFFFF5858)
//           ));
//     }
//
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
//             width: compat(231),
//             child: showChallengeTime,
//           ),
//           //SizedBox(width: compat(119)),
//           GestureDetector(
//               child: Container(
//                 width: compat(16),
//                 child: Icon(Icons.arrow_forward_ios,color: Color(0xFFBFBEBE),size: compat(16),),
//               ),
//               onTap: (){
//                 FocusScope.of(context).requestFocus(FocusNode());
//                 showTimeModal(context);
//               }
//           ),
//         ], //SizedBox(width: 30,),
//       ),
//     );
//   }
//
//   ///图片选择器
//   Widget selectChallengeIcon(){
//     Widget challengeIcon;
//     if(disabledReason.value==0||icon!=""){
//       if(icon=="")
//         challengeIcon=Text(
//           "有图更受欢迎",
//           style: TextStyle(
//               fontSize: compat(16),
//               color:Color(0xFFBFBEBE)),);
//       else challengeIcon=Text("");
//     }
//     else {
//       challengeIcon=Text(
//         "这里也不能空着",
//         style: TextStyle(
//             fontSize: compat(16),
//             color:(icon=="")? Color(0xFFFF5858):Colors.black),);
//     }
//     return Container(
//       height: compat(56),
//       child:  Row(
//         children: [
//           SizedBox(width: compat(16),),
//           SizedBox(child: Text(
//             "挑战图标",
//             style: TextStyle(fontSize: compat(16)),
//           ),
//             width: compat(96),
//           ),
//           SizedBox(
//             width: compat(191),
//             child: challengeIcon,
//           ),
//           getImageResourceWidget(),
//           SizedBox(width: compat(4)),
//           GestureDetector(
//               child: Container(
//                 width: compat(16),
//                 child: Icon(Icons.arrow_forward_ios,color: Color(0xFFBFBEBE),size: compat(16),),
//               ),
//               onTap: (){
//                 addIcon();
//               }
//           ),
//         ], //SizedBox(width: 30,),
//       ),
//     );
//   }
//
//   ///提交
//   void onPublishChallenge() async {
//     FocusScope.of(context).requestFocus(FocusNode());
//     title=_titleController.text.trim();
//     desc=_descController.text.trim();
//     ///判定填写内容
//     if(title.isEmpty||desc.isEmpty||title.length==0||desc.length==0||assets==null||freqCount==-1||freqDay==-1){
//       disabledReason.value=1;
//     }
//     else {
//       disabledReason.value=0;
//     }
//     ///未填写完成-弹出toast
//     if (disabledReason.value != 0) {
//       print(disabledReason);
//       Fluttertoast.showToast(
//           gravity: ToastGravity.CENTER,
//           msg: "还有设置内容没有填完哦：）");
//       return;
//     }
//     ///填写完成赋值icon
//     String filePath = (await  assets[0].file).path;
//     icon=filePath;
//
//     ChallengeFrequency frequency= ChallengeFrequency();
//     frequency.freqCount=freqCount;
//     frequency.freqDay=freqDay;
//     print("title:$title\ndesc:$desc\nfreq:${frequency.freqCount},${frequency.freqDay}\nicon:$icon");
//     ProgressDialog.show(context);
//     try {
//       final createChallenge= CreateChallengeRequest(
//           title: title,
//           desc: desc,
//           frequency: frequency,
//           icon: icon
//       );
//       final createChallnegeResponse = await ProtoManager.getInstance().request(createChallenge);
//       ProtoUtil.getTargetValue(createChallnegeResponse, CreateChallengeResponse());
//       ProgressDialog.dismiss(context);
//       Fluttertoast.showToast(gravity: ToastGravity.CENTER, msg: '发布成功');
//       Navigator.of(context).pop(true);
//     }
//     catch (e) {
//       debugPrint('========>add question error: $e');
//       Fluttertoast.showToast(gravity: ToastGravity.CENTER, msg: ProtoUtil.getErrorMessage(e));
//       ProgressDialog.dismiss(context);
//     }
//   }
//
//   ///滚动选择-单位
//   showUnitModal(BuildContext context) async {
//     String beforeUnit=selectedUnit;
//     final result = await Picker(
//         height: compat(124),
//         itemExtent: compat(40),
//         selectedTextStyle:TextStyle(fontSize: 24,color:Color(0xFF2C2929)),
//         title: Text("选择发表频次",style: TextStyle(fontSize: 17),),
//         cancelText:"取消",
//         cancelTextStyle: TextStyle(fontSize: 17,color: Color(0xFF1F84F7)),
//         confirmText:"确定",
//         confirmTextStyle: TextStyle(fontSize: 17,color: Color(0xFF1F84F7)),
//         adapter: PickerDataAdapter<String>(pickerdata: pickerUnitData),
//         changeToFirst: true,
//         hideHeader: false,
//         onConfirm: (picker, value) {
//           print(value);
//           freqDay=mapUnit[value[0]];
//           selectedUnit=pickerUnitData[value[0]];
//         }
//     ).showModal(this.context); //_sca
//     print("result: $result");// ffoldKey.currentState);
//     if(selectedUnit!=beforeUnit){
//       selectedTime="选择时长";
//       freqCount=-1;
//     }
//     print("${selectedUnit},${selectedTime}");
//     super.setState(() {
//     });
//   }
//
//   ///滚动选择-时长
//   showTimeModal(BuildContext context) async {
//     if(!pickerUnitData.contains(selectedUnit)){
//       Fluttertoast.showToast(msg: '请先选择发表频次', gravity: ToastGravity.CENTER);
//       return false;
//     }
//     final result = await Picker(
//         height: compat(220),
//         itemExtent: compat(40),
//         selectedTextStyle:TextStyle(fontSize: 24,color:Color(0xFF2C2929)),
//         title: Text("选择时长",style: TextStyle(fontSize: 17)),
//         cancelText:"取消",
//         cancelTextStyle: TextStyle(fontSize: 17,color: Color(0xFF1F84F7)),
//         confirmText:"确定",
//         confirmTextStyle: TextStyle(fontSize: 17,color: Color(0xFF1F84F7)),
//         adapter: PickerDataAdapter<String>(pickerdata: freqDay==7?pickerTimeDataWeek:pickerTimeDataDay),
//         changeToFirst: true,
//         hideHeader: false,
//         onConfirm: (picker, value) {
//           print(value.toString());
//           if(freqDay==7){
//             selectedTime=pickerTimeDataWeek[value[0]];
//             freqCount=mapTimeWeek[value[0]];
//           }
//           else {
//             selectedTime=pickerTimeDataDay[value[0]];
//             freqCount=mapTimeDay[value[0]];
//           }
//         }
//     ).showModal(this.context); //_sca
//     print("Choose: $result");// ffoldKey.currentState);
//     print("${selectedUnit},${selectedTime}");
//     super.setState(() {
//     });
//   }
//
//
//   void addIcon() async {
//     final result = await pickImages(context, assets: assets,maxSelectCount: 1);
//     if (result != null) {
//       assets = List<AssetEntity>.from(result);
//       icon=assets[0].relativePath;
//       print(icon);
//       if (mounted) {
//         setState(() {});
//       }
//     }
//   }
//
//   Widget getImageResourceWidget() {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(8),
//       child: assets==null?SizedBox(width:compat(36)):SizedBox(
//           width: compat(36),
//           child: Image(
//             height: compat(36),
//             width: compat(36),
//             image: AssetEntityImageProvider(
//               assets[0],
//               isOriginal: false,
//             ),
//             fit: BoxFit.cover,
//           )
//       ),
//     );
//   }
// }
// ///填写标题
// class InputChallengeTitle extends StatelessWidget{
//   final TextEditingController _titleController;
//
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
//             width: compat(96),
//             child: Text(
//               "挑战名称",
//               style: TextStyle(fontSize: compat(16),),),
//           ),
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
//                   hintText: disabledReason.value == 0?"起个名字吧（限制12字）":"尚未设置名称哦",
//                   hintStyle: TextStyle(
//                     fontFamily: "PingFangSC-Regular",
//                     color:disabledReason.value == 0?Color(0xFFBFBEBE):Color(0xFFFF5858),
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
// ///填写内容描述
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
//                   hintText: disabledReason.value == 0?"简单介绍一下吧（限制100个字）":"没有简介可不行",
//                   hintStyle: TextStyle(color:disabledReason.value == 0?Color(0xFFBFBEBE):Color(0xFFFF5858),),
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
