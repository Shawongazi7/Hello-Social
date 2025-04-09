import 'package:flutter/material.dart';
import 'package:meetmax/res/colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final TextStyle textStyle;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  final double borderWidth;
  final Widget? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50.0,
    this.backgroundColor = Colors.blue,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 16),
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.all(16.0),
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shadowColor: AppColors.black54,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor, width: borderWidth),
          ),
          padding: padding,
        ),
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon!,
                  const SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(text, style: textStyle),
                  ),
                ],
              )
            : Text(text, style: textStyle),
      ),
    );
  }
}
