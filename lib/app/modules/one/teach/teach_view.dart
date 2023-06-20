import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soft/app/comp/mycard.dart';
import 'package:soft/app/comp/mysearchbar.dart';
import 'package:soft/app/modules/one/music_view.dart';
import 'package:soft/app/theme/app_colors.dart';
import 'package:soft/app/theme/app_text_theme.dart';
import 'package:soft/res/assets_res.dart';

import 'teach_logic.dart';

class TeachPage extends StatefulWidget {
  const TeachPage({super.key});

  @override
  State<TeachPage> createState() => _TeachPageState();
}

class _TeachPageState extends State<TeachPage> with TickerProviderStateMixin {
  late var tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<TeachLogic>();
    final state = Get.find<TeachLogic>().state;

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(flex: 2),
                Expanded(
                  flex: 3,
                  child: TabBar(
                    controller: tabController,
                    labelStyle: AppTS.normal,
                    unselectedLabelColor: Colors.grey,
                    indicator: const BoxDecoration(),
                    tabs: const [
                      Text("胎教"),
                      Text("早教"),
                    ],
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  _FetusTeach(),
                  _EarlyTeach(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FetusTeach extends StatefulWidget {
  const _FetusTeach({Key? key}) : super(key: key);

  @override
  State<_FetusTeach> createState() => _FetusTeachState();
}

class _FetusTeachState extends State<_FetusTeach>
    with TickerProviderStateMixin {
  late var tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        const MySearchBar(strokeColor: Colors.grey),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.primary.withAlpha(0)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            "给胎儿一个良好\n的环境",
            style: AppTS.large.copyWith(color: const Color(0xff7A7A7A)),
          ),
        ),
        TabBar(
          controller: tabController,
          labelStyle: AppTS.normal,
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: AppColors.indicator,
          tabs: const [
            Text("胎教音乐"),
            Text("胎教视频"),
            Text("瑜伽练习"),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              _FetusMusic(),
              const _FetusVideo(),
              const _FetusYoga(),
            ],
          ),
        ),
      ],
    );
  }
}

class _FetusMusic extends StatelessWidget {
  final imgPathsT = [
    AssetsRes.TEACH_IMG_T0,
    AssetsRes.TEACH_IMG_T1,
  ];

  final imgPathsB = [
    AssetsRes.TEACH_IMG_B0,
    AssetsRes.TEACH_IMG_B1,
    AssetsRes.TEACH_IMG_B2,
    AssetsRes.TEACH_IMG_B0,
    AssetsRes.TEACH_IMG_B1,
    AssetsRes.TEACH_IMG_B2,
  ];

  final titlesB = [
    "瑜伽教程",
    "爱的教育",
    "瑜伽教程",
    "瑜伽教程",
    "爱的教育",
    "瑜伽教程",
  ];

  final namesB = [
    "胖胖妈",
    "可可妈",
    "乐乐妈",
    "胖胖妈",
    "可可妈",
    "乐乐妈",
  ];

  _FetusMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: imgPathsT.length,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
            clipBehavior: Clip.none,
            itemBuilder: (context, index) {
              return _FetusMusicItemT(
                imgPath: imgPathsT[index],
                onPressed: () {
                  Get.to(MusicPage());
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 30.w);
            },
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 25.w,
            mainAxisSpacing: 30.h,
            childAspectRatio: 0.8,
            padding:
                EdgeInsets.only(right: 30.w, left: 30.w, top: 15.h, bottom: 85),
            // physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              imgPathsB.length,
              (index) {
                return _FetusMusicItemB(
                  imgPath: imgPathsB[index],
                  title: titlesB[index],
                  name: namesB[index],
                  iconPath: AssetsRes.HEART,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _FetusMusicItemB extends StatelessWidget {
  final String imgPath;
  final String title;
  final String name;
  final String iconPath;

  const _FetusMusicItemB(
      {required this.imgPath,
      required this.title,
      required this.name,
      required this.iconPath,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(15),
      elevation: 5,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: AppColors.stroke,
              strokeAlign: BorderSide.strokeAlignOutside),
          image: DecorationImage(
            image: AssetImage(imgPath),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text(title, style: AppTS.small),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 30.h,
                color: AppColors.fillColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(name, style: AppTS.small),
                    const SizedBox(width: 5),
                    Image.asset(iconPath, width: 20.w, height: 20.h)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FetusMusicItemT extends StatelessWidget {
  final String imgPath;
  final VoidCallback? onPressed;

  const _FetusMusicItemT({required this.imgPath, this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: PhysicalModel(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        elevation: 5,
        child: Container(
          height: 140.h,
          width: 230.w,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: AppColors.stroke,
                strokeAlign: BorderSide.strokeAlignOutside),
            image: DecorationImage(
              image: AssetImage(imgPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class _FetusVideo extends StatelessWidget {
  const _FetusVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _FetusYoga extends StatelessWidget {
  const _FetusYoga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}

class _EarlyTeach extends StatefulWidget {
  const _EarlyTeach({Key? key}) : super(key: key);

  @override
  State<_EarlyTeach> createState() => _EarlyTeachState();
}

class _EarlyTeachState extends State<_EarlyTeach> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("早教"),
    );
  }
}
