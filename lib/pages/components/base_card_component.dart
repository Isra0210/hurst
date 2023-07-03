import 'package:flutter/material.dart';

class BaseCardComponent extends StatelessWidget {
  const BaseCardComponent({
    required this.child,
    required this.color,
    this.enableBoxShadow = true,
    this.padding = 12,
    this.borderRadius,
    this.margin,
    this.height,
    this.width,
    super.key,
  });

  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;
  final Widget child;
  final double? height;
  final double? width;
  final double padding;
  final Color color;
  final bool enableBoxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: height,
      width: width,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        boxShadow: !enableBoxShadow ? null : [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: child,
    );
  }
}
