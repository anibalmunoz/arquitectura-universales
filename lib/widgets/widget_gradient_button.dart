import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Function() onTap;
  final Widget child;
  final double radius;

  const MainButton(
      {required this.onTap,
      required this.child,
      required this.radius,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        padding: EdgeInsets.zero,
      ),
      child: child,
    );
  }
}

class GradientButton extends StatelessWidget {
  final double radius;
  final double height;
  final Function() onTap;
  final String? content;
  final TextStyle? textStyle;

  const GradientButton({
    required this.onTap,
    required this.content,
    this.radius = 80.0,
    this.height = 40,
    this.textStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainButton(
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: Text(content ?? "",
              textAlign: TextAlign.center, style: textStyle),
        ),
      ),
      radius: radius,
    );
  }
}
