import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meetmax/res/colors/app_colors.dart';
import 'package:meetmax/res/fonts/app_fonts.dart';
import 'package:meetmax/services/loading_service.dart';

LoadingCustomization loadingCustomization() {
  return LoadingCustomization(
    loadingWidget: loadingWidget(),
    systemUiOverlayStyle: SystemUiOverlayStyle.dark,
    errorDialogBuilder: errorDialogWidget(),
    opaqueColor: Colors.black38,
  );
}

Widget loadingWidget() {
  return Container(
    alignment: Alignment.center,
    child: CupertinoActivityIndicator(
      radius: 16,
      color: AppColors.blue,
    ),
  );
}

ErrorDialogBuilder errorDialogWidget() {
  return (String title, String message, String buttonLabel,
      Function onPressed) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: AppColors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Text(
            title,
            style: AppFonts.bodyMedium.copyWith(
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              onPressed();
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.red,
              ),
              child: Text(
                buttonLabel,
                style: AppFonts.bodyMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  };
}
