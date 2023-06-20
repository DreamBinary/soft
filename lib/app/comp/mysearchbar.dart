import 'package:flutter/material.dart';
import 'package:soft/app/theme/app_colors.dart';
import 'package:soft/app/theme/app_sizes.dart';

class MySearchBar extends StatelessWidget {
  final Color? strokeColor;

  const MySearchBar({this.strokeColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sColor = strokeColor ?? AppColors.stroke;
    var borderSide = BorderSide(
      color: sColor,
      width: AppSizes.strokeWidth,
      strokeAlign: BorderSide.strokeAlignOutside,
    );
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
          hintText: "胎动",
          contentPadding: const EdgeInsets.symmetric(horizontal: 30),
          fillColor: Colors.white,
          filled: true,
          suffixIcon: Container(
            width: 75,
            height: 45,
            decoration: BoxDecoration(
              border: Border.fromBorderSide(borderSide.copyWith(strokeAlign: BorderSide.strokeAlignInside)),
              color: const Color(0xffFDEEEB),
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: const Icon(
              Icons.search_rounded,
              size: 30,
              color: Colors.black87,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: borderSide,
            borderRadius: BorderRadius.circular(100),
          ),
          border: OutlineInputBorder(
            borderSide: borderSide.copyWith(width: AppSizes.strokeWidth * 2),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
