

import 'package:flutter/material.dart';

class MyBottomBarPlaceholder extends StatelessWidget {
  final Color color;
  final double addHeight;

  const MyBottomBarPlaceholder(
      {this.color = Colors.transparent, this.addHeight = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: double.maxFinite,
      height: 55 + addHeight,
    );
  }
}