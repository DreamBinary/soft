import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soft/app/comp/myiconbutton.dart';
import 'package:soft/app/comp/mytopbar.dart';
import 'package:soft/app/theme/app_colors.dart';
import 'package:soft/app/theme/app_sizes.dart';
import 'package:soft/app/theme/app_text_theme.dart';
import 'package:soft/res/assets_res.dart';

import 'chat_logic.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ChatLogic>();
    final state = Get.find<ChatLogic>().state;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyTopBar(
        backgroundColor: AppColors.primary,
        trailing: MyIconButton(
          icon: Icons.menu,
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          const Expanded(child: _ChatPart()),
          Container(
            color: AppColors.primary,
            child: Row(
              children: [
                MyIconButton(
                  icon: Icons.add_rounded,
                  bgColor: const Color(0xffFF6161),
                  color: Colors.white,
                  onPressed: () {},
                ),
                const Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "请输入内容",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(200),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                MyIconButton(
                  icon: Icons.send,
                  color: const Color(0xffFF6161),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatPart extends StatelessWidget {
  const _ChatPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFFFAF9),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const _DoctorIntro(),
            _ChatMessage(
              isRight: false,
              avatar: const CircleAvatar(
                backgroundImage: AssetImage(AssetsRes.DOCTOR),
              ),
              message: Text("你好。", style: AppTS.normal),
            ),
            _ChatMessage(
              avatar: const CircleAvatar(
                backgroundImage: AssetImage(AssetsRes.P0),
              ),
              message: Text("你好。", style: AppTS.normal),
            ),
            _ChatMessage(
              avatar: const CircleAvatar(
                backgroundImage: AssetImage(AssetsRes.P0),
              ),
              message: Container(
                width: 250,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: AppColors.stroke,
                    width: AppSizes.strokeWidth,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage(AssetsRes.DECO_CHAT),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            _ChatMessage(
              isRight: false,
              avatar: const CircleAvatar(
                backgroundImage: AssetImage(AssetsRes.DOCTOR),
              ),
              message: Text("目前情况良好", style: AppTS.normal),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatMessage extends StatelessWidget {
  final Widget? message;
  final Widget avatar;
  final bool isRight;

  const _ChatMessage(
      {Key? key, this.message, required this.avatar, this.isRight = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: isRight
          ? Row(
              children: [
                const Spacer(),
                Bubble(
                  nip: BubbleNip.rightCenter,
                  color: Colors.white,
                  child: message,
                ),
                const SizedBox(width: 10),
                avatar,
              ],
            )
          : Row(
              children: [
                avatar,
                const SizedBox(width: 10),
                Bubble(
                  nip: BubbleNip.leftCenter,
                  color: Colors.white,
                  child: message,
                ),
                const Spacer()
              ],
            ),
    );
  }
}

class _DoctorIntro extends StatelessWidget {
  const _DoctorIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300.w,
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        border:
            Border.all(color: AppColors.stroke, width: AppSizes.strokeWidth),
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(50),
          right: Radius.circular(25),
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(AssetsRes.DOCTOR),
            radius: 50,
          ),
          SizedBox(width: 20.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Text("李医生", style: AppTS.normal),
              _DotRow(
                child: Text(
                  "主治医师",
                  style: AppTS.small.copyWith(color: Colors.grey),
                ),
              ),
              _DotRow(
                child: Text(
                  "北京坤如玛丽妇科医院",
                  style: AppTS.small.copyWith(color: Colors.grey),
                ),
              ),
              _DotRow(
                child: Text(
                  "擅长对妇产科常见病及多发病的诊断及治疗",
                  style: AppTS.small.copyWith(color: Colors.grey),
                ),
              ),
              SizedBox(height: 10.h)
            ],
          )
        ],
      ),
    );
  }
}

class _DotRow extends StatelessWidget {
  final Color color;
  final Widget child;

  const _DotRow({this.color = Colors.grey, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 5,
          width: 5,
          decoration:
              ShapeDecoration(shape: const CircleBorder(), color: color),
        ),
        child
      ],
    );
  }
}
