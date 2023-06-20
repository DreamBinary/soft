import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:soft/app/comp/mytopbar.dart';
import 'package:soft/app/theme/app_colors.dart';
import 'package:soft/app/theme/app_sizes.dart';
import 'package:soft/app/theme/app_text_theme.dart';
import 'package:soft/res/assets_res.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  bool start = false;
  AudioPlayer player = AudioPlayer()..setAsset(AssetsRes.MUSIC);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetsRes.BG_MUSIC), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MyTopBar(
          middle: Text("根据胎心生成", style: AppTS.big.copyWith(color: Colors.grey)),
          trailing: IconButton(
            iconSize: AppSizes.iconBtn,
            icon: const Icon(Icons.more_horiz_rounded),
            onPressed: () {},
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 330.h),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("听妈妈的话", style: AppTS.big),
                  Text("周杰伦", style: AppTS.small),
                ],
              ),
              const Spacer(flex: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_previous_rounded,
                      size: AppSizes.iconBtn * 2,
                      color: const Color(0xffFFA998),
                    ),
                  ),
                  Material(
                    shape: const CircleBorder(
                        side: BorderSide(color: AppColors.stroke)),
                    color: AppColors.fillColor,
                    clipBehavior: Clip.antiAlias,
                    child: IconButton(
                      onPressed: () {
                        if (start) {
                          player.pause();
                          setState(() {
                            start = false;
                          });
                        } else {
                          player.play();
                          setState(() {
                            start = true;
                          });
                        }
                      },
                      iconSize: AppSizes.iconBtn * 2,
                      icon: Icon(
                        start ? Icons.pause_rounded : Icons.play_arrow_rounded,
                        color: const Color(0xff4E4E4E),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_next_rounded,
                      size: AppSizes.iconBtn * 2,
                      color: const Color(0xffFFA998),
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 2),
              Container(
                height: 70.h,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                margin: EdgeInsets.symmetric(horizontal: 60.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                      elevation: 5,
                      child: Image.asset(
                        AssetsRes.DECO_MUSIC0,
                        height: AppSizes.iconBtn,
                        width: AppSizes.iconBtn,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                      elevation: 5,
                      child: Image.asset(
                        AssetsRes.DECO_MUSIC1,
                        height: AppSizes.iconBtn,
                        width: AppSizes.iconBtn,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }
}
