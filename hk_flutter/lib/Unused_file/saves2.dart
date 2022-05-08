// import 'package:annotation_route/annotation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_picker/Picker.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:photo_manager/photo_manager.dart';
// import 'package:upup/manager/proto_manager.dart';
// import 'package:upup/manager/upload_manager.dart';
// import 'package:upup/pages/circle/widgets/commit_button_widget.dart';
// import 'package:upup/pages/common/constants.dart';
// import 'package:upup/pages/routers/page_base.dart';
// import 'package:upup/proto/guard_circle.pb.dart';
// import 'package:upup/proto/guardcomm.pb.dart';
// import 'package:upup/utils/circle_util.dart';
// import 'package:upup/utils/compat_util.dart';
// import 'package:upup/utils/progress_dialog.dart';
// import 'package:upup/utils/proto_util.dart';
// import 'package:upup/utils/ui_util.dart';
// import 'package:wechat_assets_picker/wechat_assets_picker.dart';
// import 'package:wechat_camera_picker/wechat_camera_picker.dart';
// import 'package:upup/pages/common/up_color.dart';
//
// /// 创建挑战页面
// @RouteDefine('challengeCreatePage')
// class ChallengeCreatePage extends PageBase {
//   ChallengeCreatePage(String routeName, Map<String, Object> routeArguments)
//       : super(routeName, routeArguments);
//
//   @override
//   _ChallengeCreatePage createState() => _ChallengeCreatePage();
// }
//
// ValueNotifier<int> disabledReason = ValueNotifier<int>(0);
//
// class _ChallengeCreatePage extends State<ChallengeCreatePage> {
//   List<AssetEntity> assets;
//   TextEditingController _titleController;
//   TextEditingController _descController;
//
//   ///需要储存的数据
//   int freqDay = -1, freqCount = -1;
//   String icon = "";
//   String title;
//   String desc;
//
//   ///选择项
//   String selectedUnit = "";
//   String selectedTime = "";
//
//   ///数据转换
//   final Map<int, int> mapUnit = {0: 1, 1: 7};
//   final Map<int, int> mapTimeDay = {
//     0: 7,
//     1: 21,
//     2: 365,
//   };
//   final Map<int, int> mapTimeWeek = {
//     0: 4,
//     1: 12,
//     2: 52,
//   };
//
//   ///滚动列表数据
//   final List<Map> pickerData = [
//     {
//       "按天": [
//         "7天",
//         "21天",
//         "365天",
//       ]
//     },
//     {
//       "按周": [
//         "4周",
//         "12周",
//         "52周",
//       ]
//     }
//   ];
//   // final List<String> pickerUnitData = ["按天", "按周"];
//   // final List<String> pickerTimeDataDay = [
//   //   "3天",
//   //   "7天",
//   //   "21天",
//   //   "28天",
//   //   "90天",
//   //   "180天",
//   //   "360天"
//   // ];
//   final List<String> pickerTimeDataWeek = ["4周", "8周", "12周", "16周", "32周"];
//
//   ///默认图地址
//   final String defaultIcon = 'assets/images/ic_default_challenge.png';
//
//   @override
//   void initState() {
//     _titleController = TextEditingController(text: '');
//     _descController = TextEditingController(text: '');
//     disabledReason.value = 0;
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
//         backgroundColor: UpColors.baseBgColor,
//         appBar: getCommonAppBar(
//           '创建新的挑战',
//           onPressed: () => Navigator.pop(context),
//           actions: [
//             CommitButtonWidget('创建', true, publishChallenge),
//             SizedBox(width: compat(16)),
//           ],
//         ),
//         body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(height: compat(12)),
//                 Container(
//                   color: Colors.white,
//                   height: compat(344),
//                   child: Column(
//                     children: [
//                       ChallengeTitle(_titleController),
//                       ChallengeDesc(_descController),
//                       challengeRule(),
//                       challengeIcon(),
//                     ],
//                   ),
//                 )
//               ],
//             )));
//   }
//
//   ///选择挑战计数规则
//   Widget challengeRule() {
//     Widget showChallengeUnit;
//     if (disabledReason.value == 0 || selectedUnit != "") {
//       showChallengeUnit = Text(
//         "$selectedUnit $selectedTime",
//         style: TextStyle(
//           fontSize: compat(16),
//           color: (selectedUnit == "")
//               ? UpColors.tipsTextColor
//               : UpColors.titleTextColor,
//         ),
//       );
//     } else {
//       showChallengeUnit = Text(
//         "请选择合适的挑战规则",
//         style: TextStyle(
//           fontSize: compat(16),
//           color: UpColors.redTextColor,
//         ),
//       );
//     }
//     return Container(
//       height: compat(56),
//       decoration: BoxDecoration(
//         border: Border(
//           bottom: BorderSide(
//             width: 0.5,
//             color: UpColors.baseBgColor,
//           ),
//         ),
//       ),
//       child: Row(
//         children: [
//           SizedBox(
//             width: compat(16),
//           ),
//           SizedBox(
//             child: Text(
//               "挑战规则",
//               style: TextStyle(
//                 fontSize: compat(16),
//               ),
//             ),
//             width: compat(96),
//           ),
//           GestureDetector(
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: compat(231),
//                     child: showChallengeUnit,
//                   ),
//                   Container(
//                     width: compat(16),
//                     child: Icon(
//                       Icons.arrow_forward_ios,
//                       color: UpColors.tipsTextColor,
//                       size: compat(16),
//                     ),
//                   ),
//                 ],
//               ),
//               onTap: () {
//                 FocusScope.of(context).requestFocus(FocusNode());
//                 showPickerModal(context);
//               }),
//         ], //SizedBox(width: 30,),
//       ),
//     );
//   }
//
//   ///选择挑战时长
//   // Widget challengeTime() {
//   //   Widget showChallengeTime;
//   //   if (disabledReason.value == 0 || selectedTime != "选择时长") {
//   //     showChallengeTime = Text(
//   //       "$selectedTime",
//   //       style: TextStyle(
//   //           fontSize: compat(16),
//   //           color: (selectedTime == "选择时长")
//   //               ? UpColors.tipsTextColor
//   //               : Colors.black),
//   //     );
//   //   } else {
//   //     showChallengeTime = Text(
//   //       "这里也不能空着",
//   //       style: TextStyle(
//   //         fontSize: compat(16),
//   //         color: UpColors.redTextColor,
//   //       ),
//   //     );
//   //   }
//   //
//   //   return Container(
//   //     height: compat(56),
//   //     decoration: BoxDecoration(
//   //       border: Border(
//   //         bottom: BorderSide(
//   //           width: 0.5,
//   //           color: UpColors.baseBgColor,
//   //         ),
//   //       ),
//   //     ),
//   //     child: Row(
//   //       children: [
//   //         SizedBox(
//   //           width: compat(112),
//   //         ),
//   //         GestureDetector(
//   //             child: Row(
//   //               children: [
//   //                 SizedBox(
//   //                   width: compat(231),
//   //                   child: showChallengeTime,
//   //                 ),
//   //                 Container(
//   //                   width: compat(16),
//   //                   child: Icon(
//   //                     Icons.arrow_forward_ios,
//   //                     color: UpColors.tipsTextColor,
//   //                     size: compat(16),
//   //                   ),
//   //                 ),
//   //               ],
//   //             ),
//   //             onTap: () {
//   //               FocusScope.of(context).requestFocus(FocusNode());
//   //               showTimeModal(context);
//   //             }),
//   //       ], //SizedBox(width: 30,),
//   //     ),
//   //   );
//   // }
//
//   ///图片选择器
//   Widget challengeIcon() {
//     Widget challengeIcon;
//     if (disabledReason.value == 0 || icon != "") {
//       if (icon == "")
//         challengeIcon = Text(
//           "有图更受欢迎",
//           style: TextStyle(
//             fontSize: compat(16),
//             color: UpColors.tipsTextColor,
//           ),
//         );
//       else
//         challengeIcon = Text("");
//     }
//     return Container(
//       height: compat(56),
//       child: Row(
//         children: [
//           SizedBox(
//             width: compat(16),
//           ),
//           SizedBox(
//             child: Text(
//               "挑战图标",
//               style: TextStyle(fontSize: compat(16)),
//             ),
//             width: compat(96),
//           ),
//           GestureDetector(
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: compat(191),
//                   child: challengeIcon,
//                 ),
//                 getImageResourceWidget(),
//                 SizedBox(width: compat(4)),
//                 Container(
//                   width: compat(16),
//                   child: Icon(
//                     Icons.arrow_forward_ios,
//                     color: UpColors.tipsTextColor,
//                     size: compat(16),
//                   ),
//                 ),
//               ],
//             ),
//             onTap: () {
//               addIcon();
//             },
//           )
//         ], //SizedBox(width: 30,),
//       ),
//     );
//   }
//
//   ///提交
//   void publishChallenge() async {
//     FocusScope.of(context).requestFocus(FocusNode());
//     title = _titleController.text.trim();
//     desc = _descController.text.trim();
//     if (icon == "") icon = defaultIcon;
//
//     ///判定填写内容
//     if (title.isEmpty ||
//         desc.isEmpty ||
//         title.length == 0 ||
//         desc.length == 0 ||
//         freqCount == -1 ||
//         freqDay == -1) {
//       disabledReason.value = 1;
//     } else {
//       disabledReason.value = 0;
//     }
//
//     ///未填写完成-弹出toast
//     if (disabledReason.value != 0) {
//       // print(disabledReason);
//       Fluttertoast.showToast(
//           gravity: ToastGravity.CENTER, msg: "还有设置内容没有填完哦：）");
//       return;
//     }
//
//     ///填写完成赋值icon+设置默认图标
//     if (assets != null) {
//       String filePath = (await assets[0].file).path;
//       icon = filePath;
//     }
//     ChallengeFrequency frequency = ChallengeFrequency();
//     frequency.freqCount = freqCount;
//     frequency.freqDay = freqDay;
//     ProgressDialog.show(context);
//     try {
//       ///上传图片并获取地址（默认图无需上传）
//       String downloadPath;
//       if (icon != defaultIcon)
//         downloadPath = await UploadManager().uploadPicture(icon);
//       else
//         downloadPath = Constants.DEFAULT_CHALLENGE_URL;
//
//       final createChallenge = CreateChallengeRequest(
//           title: title, desc: desc, frequency: frequency, icon: downloadPath);
//       final createChallnegeResponse =
//       await ProtoManager.getInstance().request(createChallenge);
//       ProtoUtil.getTargetValue(
//           createChallnegeResponse, CreateChallengeResponse());
//       ProgressDialog.dismiss(context);
//       Fluttertoast.showToast(gravity: ToastGravity.CENTER, msg: '发布成功');
//       Navigator.of(context).pop(true);
//     } catch (e) {
//       debugPrint('========>add question error: $e');
//       Fluttertoast.showToast(
//         gravity: ToastGravity.CENTER,
//         msg: ProtoUtil.getErrorMessage(e),
//       );
//       ProgressDialog.dismiss(context);
//     }
//   }
//
//   ///滚动选择-单位
//   showPickerModal(BuildContext context) async {
//     String beforeUnit = selectedUnit;
//     final result = await Picker(
//         height: compat(124),
//         itemExtent: compat(40),
//         selectedTextStyle: TextStyle(
//           fontSize: 24,
//           color: UpColors.titleTextColor,
//           fontWeight: FontWeight.w500,
//         ),
//         title: Text(
//           "选择时间单位",
//           style: TextStyle(fontSize: 17),
//         ),
//         cancelText: "取消",
//         cancelTextStyle: TextStyle(
//           fontSize: 17,
//           color: UpColors.blueTxtColor2,
//         ),
//         confirmText: "确定",
//         confirmTextStyle: TextStyle(
//           fontSize: 17,
//           color: UpColors.blueTxtColor2,
//         ),
//         adapter: PickerDataAdapter<String>(pickerdata: pickerData),
//         changeToFirst: true,
//         hideHeader: false,
//         onConfirm: (picker, value) {
//           freqDay = mapUnit[value[0]];
//           selectedUnit = pickerUnitData[value[0]];
//           selectedTime =
//         }).showModal(this.context); //_sca
//     print("result: $result"); // ffoldKey.currentState);
//     super.setState(() {});
//   }
//   //
//   // ///滚动选择-时长
//   // showTimeModal(BuildContext context) async {
//   //   if (!pickerUnitData.contains(selectedUnit)) {
//   //     Fluttertoast.showToast(msg: '请先选择发表频次', gravity: ToastGravity.CENTER);
//   //     return false;
//   //   }
//   //   final result = await Picker(
//   //       height: compat(220),
//   //       itemExtent: compat(40),
//   //       selectedTextStyle: TextStyle(
//   //         fontSize: 24,
//   //         color: UpColors.titleTextColor,
//   //         fontWeight: FontWeight.w500,
//   //       ),
//   //       title: Text("选择时长", style: TextStyle(fontSize: 17)),
//   //       cancelText: "取消",
//   //       cancelTextStyle: TextStyle(fontSize: 17, color: UpColors.blueTxtColor2),
//   //       confirmText: "确定",
//   //       confirmTextStyle:
//   //           TextStyle(fontSize: 17, color: UpColors.blueTxtColor2),
//   //       adapter: PickerDataAdapter<String>(
//   //           pickerdata: freqDay == 7 ? pickerTimeDataWeek : pickerTimeDataDay),
//   //       changeToFirst: true,
//   //       hideHeader: false,
//   //       onConfirm: (picker, value) {
//   //         if (freqDay == 7) {
//   //           selectedTime = pickerTimeDataWeek[value[0]];
//   //           freqCount = mapTimeWeek[value[0]];
//   //         } else {
//   //           selectedTime = pickerTimeDataDay[value[0]];
//   //           freqCount = mapTimeDay[value[0]];
//   //         }
//   //       }).showModal(this.context); //_sca
//   //   print("$result");
//   //   super.setState(() {});
//   // }
//
//   void addIcon() async {
//     final result = await pickImages(context, assets: assets, maxSelectCount: 1);
//     if (result != null) {
//       assets = List<AssetEntity>.from(result);
//       icon = assets[0].relativePath;
//       if (mounted) {
//         setState(() {});
//       }
//     }
//   }
//
//   Widget getImageResourceWidget() {
//     Widget showIcon;
//     if (assets == null && disabledReason.value == 1) {
//       showIcon = SizedBox(
//         width: compat(36),
//         child: Image.asset(
//           icon,
//           width: compat(36),
//           height: compat(36),
//         ),
//       );
//     } else
//       showIcon = SizedBox(
//         width: compat(36),
//       );
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(8),
//       child: assets == null
//           ? showIcon
//           : SizedBox(
//           width: compat(36),
//           child: Image(
//             height: compat(36),
//             width: compat(36),
//             image: AssetEntityImageProvider(
//               assets[0],
//               isOriginal: false,
//             ),
//             fit: BoxFit.cover,
//           )),
//     );
//   }
// }
//
// ///填写标题
// class ChallengeTitle extends StatelessWidget {
//   final TextEditingController _titleController;
//
//   const ChallengeTitle(
//       this._titleController,
//       );
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: compat(56),
//       decoration: BoxDecoration(
//         border: Border(
//           bottom: BorderSide(width: 0.5, color: UpColors.baseBgColor),
//         ),
//       ),
//       child: Row(
//         children: [
//           SizedBox(
//             width: compat(16),
//           ),
//           SizedBox(
//             width: compat(96),
//             child: Text(
//               "挑战名称",
//               style: TextStyle(
//                 fontSize: compat(16),
//               ),
//             ),
//           ),
//           SizedBox(
//             width: compat(247),
//             child: TextField(
//               controller: _titleController,
//               maxLength: 12,
//               style: TextStyle(fontSize: compat(16)),
//               decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText:
//                   disabledReason.value == 0 ? "起个名字吧（限制12字）" : "请填写挑战名称",
//                   hintStyle: TextStyle(
//                     color: disabledReason.value == 0
//                         ? UpColors.tipsTextColor
//                         : UpColors.redTextColor,
//                   ),
//                   counterText: ""),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// ///填写内容描述
// class ChallengeDesc extends StatelessWidget {
//   final TextEditingController textEditController;
//   const ChallengeDesc(
//       this.textEditController,
//       );
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: compat(120),
//       decoration: BoxDecoration(
//         border: Border(
//           bottom: BorderSide(width: 0.5, color: UpColors.baseBgColor),
//         ),
//       ),
//       child: Row(
//         children: [
//           SizedBox(
//             width: compat(16),
//           ),
//           Container(
//             height: compat(95),
//             alignment: Alignment.topLeft,
//             child: Text(
//               "简介",
//               style: TextStyle(fontSize: compat(16)),
//             ),
//             width: compat(64),
//           ),
//           SizedBox(
//             width: compat(32),
//           ),
//           SizedBox(
//             width: compat(247),
//             child: TextField(
//               controller: textEditController,
//               style: TextStyle(fontSize: compat(16)),
//               maxLines: 6,
//               maxLength: 100,
//               decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: disabledReason.value == 0
//                       ? "简单介绍一下吧（限制100个字）"
//                       : "请填写挑战简介",
//                   hintStyle: TextStyle(
//                     color: disabledReason.value == 0
//                         ? UpColors.tipsTextColor
//                         : UpColors.redTextColor,
//                   ),
//                   counterText: ""),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
