import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final double? width, height, size;
  final Color? color;
  final IconData icon;
  final bool hasGradient;

  const ChoiceButton(
      {super.key,
      this.width,
      this.height,
      this.size,
      this.color,
      this.hasGradient = false,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width ?? 60,
      width: height ?? 60,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          gradient: hasGradient
              ? LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).colorScheme.secondary,
                  ],
                )
              : const LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(50),
              spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(3, 4),
            ),
          ]),
      child: Icon(
        icon,
        size: size ?? 20,
        color: color ?? Theme.of(context).primaryColor,
      ),
    );
  }
}
