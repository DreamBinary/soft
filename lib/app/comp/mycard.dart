import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final GestureTapCallback? onPressed;
  final Widget? child;
  final double? elevation;
  final BorderSide side;
  final EdgeInsetsGeometry? padding;

  const MyCard({
    super.key,
    this.color,
    this.height,
    this.width,
    this.onPressed,
    this.elevation = 10,
    this.child,
    this.side = BorderSide.none,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), side: side),
      elevation: elevation,
      clipBehavior: Clip.antiAlias,
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: onPressed,
        child: Container(
          height: height,
          width: width,
          padding: padding,
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
