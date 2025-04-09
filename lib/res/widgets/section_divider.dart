import 'package:flutter/material.dart';
import 'package:meetmax/res/colors/app_colors.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      color: AppColors.sectionDivider,
    );
  }
}
