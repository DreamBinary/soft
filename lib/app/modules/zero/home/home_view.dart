import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soft/app/comp/head_intro.dart';
import 'package:soft/app/comp/mybottombarplaceholder.dart';
import 'package:soft/app/comp/mycard.dart';
import 'package:soft/app/routes/app_pages.dart';
import 'package:soft/app/theme/app_colors.dart';
import 'package:soft/app/theme/app_text_theme.dart';
import 'package:soft/res/assets_res.dart';
import 'package:status_bar_control/status_bar_control.dart';

import '../../../comp/mysearchbar.dart';
import '../../../comp/mytopbar.dart';
import '../../../theme/app_sizes.dart';
import 'home_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, Map<String, dynamic>> days = {
    "2021-12-31": {
      "score": 98,
      "rate": 125,
      "times": 3,
      "isNormal": true,
    },
    "2021-12-30": {
      "score": 96,
      "rate": 120,
      "times": 2,
      "isNormal": true,
    },
  };

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<HomeLogic>();
    final state = Get.find<HomeLogic>().state;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsRes.BG_HOME),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MySearchBar(),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: HeadIntro(),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: days.length,
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      clipBehavior: Clip.none,
                      itemBuilder: (context, index) {
                        return _DayCard(
                          time: days.keys.toList()[index],
                          score: days.values.toList()[index]["score"],
                          rate: days.values.toList()[index]["rate"],
                          times: days.values.toList()[index]["times"],
                          isNormal: days.values.toList()[index]["isNormal"],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 20.w);
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
                    child: Text(
                      "现在你的 体重 已经增加了8.5kg，在怀孕后期，你的体重每周以500g的速度增加也属于正常情况，因为胎儿在快速的成长。 不断笨重的身体会让你的行动迟缓，身体各部位的不适感会也让你变得慵懒，不过为了顺利分娩 ，你还是要适量多做些运动。",
                      style: AppTS.small.copyWith(color: Colors.grey),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("胎心率", style: AppTS.small),
                      Container(
                        decoration: const ShapeDecoration(
                          shape: StadiumBorder(
                            side: BorderSide(color: AppColors.stroke),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                        child: Text("查看详细", style: AppTS.small),
                      )
                    ],
                  ).paddingSymmetric(horizontal: 30.w, vertical: 10.h),
                  Image.asset(AssetsRes.LINE_CHART).paddingSymmetric(horizontal: 20.w),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
          bottomNavigationBar: const MyBottomBarPlaceholder(
            addHeight: 10,
          ),
          floatingActionButton: SizedBox(
            height: 120,
            width: 120,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {
                  Get.toNamed(Routes.check);
                },
                child: Text(
                  "开始测量",
                  style: AppTS.small,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DayCard extends StatelessWidget {
  final String time;
  final int score;
  final int rate;
  final int times;
  final bool isNormal;

  const _DayCard({
    required this.time,
    required this.score,
    required this.rate,
    required this.times,
    required this.isNormal,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCard(
      color: const Color(0xffFFFAF9),
      side:  BorderSide(color: AppColors.stroke, width: AppSizes.strokeWidth),
      elevation: 3,
      height: 180.h,
      width: 190.w,
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(time, style: AppTS.small),
                  Text("$score分", style: AppTS.big),
                ],
              ),
              Image.asset(
                AssetsRes.DECO_DAYCARD,
                height: 25,
              ),
            ],
          ),
          _DayCardDetail(title: "平均胎心率", dec: "$rate 次/分"),
          _DayCardDetail(title: "加速次数", dec: "$times 次/分"),
          _DayCardDetail(title: "振幅变异", dec: isNormal ? "正常" : "异常"),
        ],
      ),
    );
  }
}

class _DayCardDetail extends StatelessWidget {
  final String title;
  final String dec;

  const _DayCardDetail({required this.title, required this.dec, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const ShapeDecoration(
          shape: StadiumBorder(), color: Color(0xffFFE5E5)),
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTS.small),
          Text(dec, style: AppTS.small),
        ],
      ),
    );
  }
}
