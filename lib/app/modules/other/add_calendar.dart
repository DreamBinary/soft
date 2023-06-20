import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:soft/app/comp/myiconbutton.dart';
import 'package:soft/app/comp/mytopbar.dart';
import 'package:soft/app/theme/app_colors.dart';
import 'package:soft/app/theme/app_text_theme.dart';
import 'package:soft/res/assets_res.dart';

import '../../theme/app_sizes.dart';

class AddCalendarPage extends StatelessWidget {
  const AddCalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyTopBar(
        trailing: MyIconButton(
          icon: Icons.done_rounded,
          onPressed: () {},
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            TextField(
              style: AppTS.normal,
              decoration: const InputDecoration(
                hintText: "请写下标题",
                border: InputBorder.none,
              ),
            ).paddingSymmetric(horizontal: 20.w),
            const Divider(
              height: 0,
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Colors.grey,
            ),
            Expanded(
              child: TextField(
                style: AppTS.normal,
                maxLines: 100,
                decoration: const InputDecoration(
                  hintText: "请写下内容",
                  border: InputBorder.none,
                ),
              ).paddingSymmetric(horizontal: 20.w),
            ),
            Container(
              color: AppColors.bgColor,
              child: DefaultTextStyle(
                style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _MyTab(
                      iconPath: AssetsRes.ADD_ICON0,
                      text: "图片",
                      onTap: () {},
                    ),
                    _MyTab(
                      iconPath: AssetsRes.ADD_ICON1,
                      text: "音频",
                      onTap: () {},
                    ),
                    _MyTab(
                      iconPath: AssetsRes.ADD_ICON2,
                      text: "今日卡片",
                      showWidget: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.stroke,
                            width: AppSizes.strokeWidth,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xffFFFAF9),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("点击添加卡片", style: AppTS.normal),
                            ),
                            Container(
                              height: 150.w,
                              width: 150.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffFFD4D5),
                                    width: AppSizes.strokeWidth),
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(AssetsRes.DECO_ADD0),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 150.w,
                              width: 150.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffEFCB8F),
                                    width: AppSizes.strokeWidth),
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(AssetsRes.DECO_ADD1),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 150.w,
                              width: 150.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffEFCB8F),
                                    width: AppSizes.strokeWidth),
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(AssetsRes.DECO_ADD2),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // onTap: (){
                      //
                      //   // attachDialog(context);
                      // },
                    ),
                    _MyTab(
                      iconPath: AssetsRes.ADD_ICON3,
                      text: "收藏",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MyTab extends StatelessWidget {
  final String iconPath;
  final String text;
  final Widget? showWidget;
  final GestureTapCallback? onTap;

  const _MyTab(
      {required this.iconPath,
      required this.text,
      this.showWidget,
      this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (showWidget != null) {
          SmartDialog.showAttach(
            targetContext: context,
            alignment: Alignment.topCenter,
            animationType: SmartAnimationType.scale,
            highlightBuilder: (_, __) {
              return Positioned(child: Container());
            },
            scalePointBuilder: (selfSize) =>
                Offset(selfSize.width / 2, selfSize.height),
            builder: (_) {
              return showWidget!;
            },
          );
        } else if (onTap != null) {
          onTap!();
        }
      },
      child: Tab(
        icon: Image.asset(iconPath, width: 30.w, height: 30.h),
        iconMargin: const EdgeInsets.all(2),
        text: text,
      ),
    );
  }
}
