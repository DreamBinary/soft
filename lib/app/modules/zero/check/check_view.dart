import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soft/app/comp/mytopbar.dart';
import 'package:soft/app/modules/other/add_calendar.dart';
import 'package:soft/app/routes/app_pages.dart';
import 'package:soft/app/theme/app_text_theme.dart';
import 'package:soft/res/assets_res.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_sizes.dart';
import 'check_logic.dart';

class CheckPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CheckLogic>();
    final state = Get.find<CheckLogic>().state;

    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 210,
              decoration: BoxDecoration(
                color: AppColors.bgColor,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: MyTopBar(
              middle: Text("胎心监测", style: AppTS.large),
            ),
            body: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 40.h),
                    height: 180.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.stroke, width: AppSizes.strokeWidth),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    clipBehavior: Clip.none,
                    child: Stack(clipBehavior: Clip.none, children: [
                      Positioned(
                        top: -40.h,
                        left: 30.w,
                        child: Image.asset(
                          AssetsRes.DECO_CHECK,
                          width: 90.w,
                          height: 120.h,
                        ),
                      ),
                      Positioned(
                        top: 50.h,
                        right: 40.w,
                        child: Text("正在检测...", style: AppTS.big),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            _CheckItem(
                              imgPath: AssetsRes.DECO_CHECK0,
                              title: "平均胎心率",
                              value: 136,
                            ),
                            _CheckItem(
                              imgPath: AssetsRes.DECO_CHECK1,
                              title: "胎动数",
                              value: 3,
                            ),
                          ],
                        ).paddingOnly(bottom: 25.h),
                      )
                    ]),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.w),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                            color: AppColors.stroke,
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignOutside),
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 30.h),
                          Image.asset(AssetsRes.CHECK_LINE,
                              width: 250.w, height: 250.h),
                          MaterialButton(
                            onPressed: () {
                              Get.toNamed(Routes.listen);
                            },
                            color: const Color(0xfffda7a9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
                            child: Text("听胎心", style: AppTS.normal.copyWith(color: Colors.white)),
                          ),
                           Divider(
                              height: 2, thickness:AppSizes.strokeWidth, color: AppColors.stroke),
                          Container(
                            height: 50.h,
                            color: AppColors.fillColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _Legend(
                                    icon: Text(
                                      "--",
                                      style: AppTS.large.copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    title: "胎心曲线"),
                                _Legend(
                                    icon: Text(
                                      "-",
                                      style: AppTS.large.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    title: "宫缩曲线"),
                                _Legend(
                                    icon: Text(
                                      "·",
                                      style: AppTS.large.copyWith(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    title: "胎动"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  MaterialButton(
                    onPressed: () {
                      Get.to(AddCalendarPage());
                    },
                    color: const Color(0xffFF8083),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
                    child: Text("导入手账本", style: AppTS.normal.copyWith(color: Colors.white)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CheckItem extends StatelessWidget {
  final String imgPath;
  final String title;
  final int value;

  const _CheckItem(
      {required this.imgPath,
      required this.title,
      required this.value,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(imgPath, height: 40, width: 40),
        const SizedBox(width: 10),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: AppTS.small),
            const SizedBox(height: 5),
            Text("$value", style: AppTS.big),
          ],
        )
      ],
    );
  }
}

class _Legend extends StatelessWidget {
  final Widget icon;
  final String title;

  const _Legend({required this.icon, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(width: 10),
        Text(title, style: AppTS.small),
      ],
    );
  }
}
