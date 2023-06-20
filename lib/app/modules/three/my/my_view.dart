import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soft/app/comp/head_intro.dart';
import 'package:soft/app/modules/three/chat/chat_view.dart';
import 'package:soft/app/routes/app_pages.dart';
import 'package:soft/app/theme/app_sizes.dart';
import 'package:soft/utils/toast.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';
import 'my_logic.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<MyLogic>();
    final state = Get.find<MyLogic>().state;

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
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30.h),
                const HeadIntro(),
                SettingContain(items: [
                  SettingItem(
                    title: "我的记录",
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                    ),
                    onTap: () {},
                  ),
                  SettingItem(
                    title: "孕期小知识",
                    onTap: () {},
                  ),
                  SettingItem(
                    title: "待产清单",
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(15),
                      ),
                    ),
                    onTap: () {},
                  ),
                ]),
                SettingContain(items: [
                  SettingItem(
                    title: "设置",
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                    ),
                    onTap: () {},
                  ),
                  SettingItem(
                    title: "更多反馈",
                    onTap: () {},
                  ),
                  SettingItem(
                    title: "医生交流",
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(15),
                      ),
                    ),
                    onTap: (){
                      Get.toNamed(Routes.chat);
                    },
                  ),
                ]),
              ],
            ).paddingSymmetric(horizontal: 30),
          )
        ],
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final String title;
  final ShapeBorder? shape;
  final GestureTapCallback? onTap;

  const SettingItem({
    Key? key,
    required this.title,
    this.shape,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      shape: shape,
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          title,
          style: AppTS.normal,
        ),
      ),
      minVerticalPadding: 20,
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

class SettingItemOpen extends SettingItem {
  final OpenContainerBuilder openBuilder;

  const SettingItemOpen(
      {super.key,
      required super.title,
      super.shape,
      required this.openBuilder});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        closedElevation: 0,
        closedShape: super.shape ?? const RoundedRectangleBorder(),
        closedBuilder: (context, action) => super.build(context),
        openBuilder: openBuilder);
  }
}

class SettingContain extends StatelessWidget {
  final List<SettingItem> items;
  final List<Widget> children = [];

  SettingContain({required this.items, Key? key}) : super(key: key) {
    for (int i = 0; i < items.length; i++) {
      children.add(items[i]);
      if (i != items.length - 1) {
        children.add(
          const Divider(
            height: 0,
            thickness: 1,
            indent: 15,
            endIndent: 15,
            color: AppColors.stroke,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
        elevation: 3,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          side:
              BorderSide(color: AppColors.stroke, width: AppSizes.strokeWidth),
        ),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
