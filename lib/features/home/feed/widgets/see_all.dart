import 'package:flutter/material.dart';
import 'package:meetmax/res/colors/app_colors.dart';
import 'package:meetmax/utils/app_utils.dart';

class SeeAll extends StatelessWidget {
  final String title;
  final String seeAll;

  const SeeAll({
    required this.title,
    required this.seeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
            onTap: () {
              AppUtils.instance
                  .showInfoToast('See all feature is not implemented yet.');
            },
            child: Text(
              seeAll,
              style: TextStyle(
                color: AppColors.blue,
                fontSize: 12,
              ),
            )),
      ],
    );
  }
}
