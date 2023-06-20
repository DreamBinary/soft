import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:soft/app/modules/three/my/my_view.dart';
import 'package:soft/app/modules/two/calendar/calendar_view.dart';
import 'package:soft/app/theme/app_colors.dart';
import 'package:soft/app/theme/app_sizes.dart';
import 'package:soft/res/assets_res.dart';

import '../one/teach/teach_view.dart';
import '../zero/home/home_view.dart';
import 'route_logic.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({super.key});

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> with TickerProviderStateMixin {
  int currentIndex = 0;
  final logic = Get.find<RouteLogic>();
  final state = Get.find<RouteLogic>().state;

  late var tabController = TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBg,
      body: BottomBar(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        barColor: AppColors.bottomBar,
        body: (context, controller) {
          return TabBarView(controller: tabController, children: const [
            HomePage(),
            TeachPage(),
            CalendarPage(),
            MyPage(),
          ]);
        },
        child: PhysicalModel(
          color: AppColors.bottomBar,
          elevation: 10,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          child: SizedBox(
            height: 55,
            child: TabBar(
              controller: tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.whiteBg,
              ),
              tabs: [
                Image.asset(AssetsRes.BOTTOMBAR0,
                    width: AppSizes.iconBtn, height: AppSizes.iconBtn),
                Image.asset(AssetsRes.BOTTOMBAR1,
                    width: AppSizes.iconBtn, height: AppSizes.iconBtn),
                Image.asset(AssetsRes.BOTTOMBAR2,
                    width: AppSizes.iconBtn, height: AppSizes.iconBtn),
                Image.asset(AssetsRes.BOTTOMBAR3,
                    width: AppSizes.iconBtn, height: AppSizes.iconBtn),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
