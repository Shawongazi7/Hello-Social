import 'package:flutter/material.dart';
import 'package:meetmax/res/colors/app_colors.dart';

class IconTextRow extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback? onTap;

  const IconTextRow(
      {required this.iconPath, required this.label, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkRipple.splashFactory,
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            iconPath,
            width: 15,
            fit: BoxFit.contain,
            color: AppColors.black87,
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              color: AppColors.black87,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
