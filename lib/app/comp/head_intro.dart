import 'package:flutter/material.dart';
import 'package:soft/app/comp/my_header/header_view.dart';

import '../theme/app_text_theme.dart';

class HeadIntro extends StatelessWidget {
  const HeadIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const HeaderComponent(radius: 35,),
        const SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello,Sunny!",
              style: AppTS.normal,
            ),
            Text(
              "已孕32周+1天",
              style: AppTS.large,
            ),
          ],
        )
      ],
    );
  }
}
