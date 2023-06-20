import 'package:flutter/material.dart';

import '../theme/app_sizes.dart';

class MyIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color color;
  final Color bgColor;

  const MyIconButton(
      {required this.icon,
      this.onPressed,
      this.color = Colors.black54,
      this.bgColor = Colors.transparent,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: IconButton(
        padding: const EdgeInsets.all(5),
        icon: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bgColor,
          ),
          child: Icon(
            icon,
            size: AppSizes.iconBtn,
            color: color,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
