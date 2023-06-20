import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import 'package:soft/app/comp/mytopbar.dart';
import 'package:soft/app/theme/app_colors.dart';
import 'package:soft/app/theme/app_text_theme.dart';
import 'package:soft/res/assets_res.dart';

import 'listen_logic.dart';

class ListenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ListenLogic>();
    final state = Get.find<ListenLogic>().state;

    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ShapeOfView(
              elevation: 0,
              shape: ArcShape(
                height: 50,
                direction: ArcDirection.Outside,
                position: ArcPosition.Bottom,
              ),
              child: Container(
                color: const Color(0xffFFF4F4),
                height: 170,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ShapeOfView(
              shape: ArcShape(
                height: 80,
                direction: ArcDirection.Outside,
                position: ArcPosition.Top,
              ),
              child: Container(
                decoration: BoxDecoration(
                  // color: const Color(0xffFFF4F4),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xffFFE6E6),
                      const Color(0xffFFE6E6),
                      const Color(0xffFFE6E6).withOpacity(0),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 160
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const MyTopBar(),
            body: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AssetsRes.HEART, height: 30, width: 30),
                      const SizedBox(width: 10),
                      Text("当前胎心率   136", style: AppTS.normal.copyWith(color: const Color(0xffE77171))),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Expanded(child: Image.asset(AssetsRes.BG_LISTEN, width: 250)),
                  MaterialButton(
                    height: 160,
                    shape: const CircleBorder(side: BorderSide(color: AppColors.stroke)),
                    color: const Color(0xffFFFAF9),
                    onPressed: (){},
                    child: Text(
                      "听胎心",
                      style: AppTS.largex,
                    ),
                  ),
                  const SizedBox(height: 60),
                ]
              ),
            ),
          )

        ],
      ),
    );
  }
}
