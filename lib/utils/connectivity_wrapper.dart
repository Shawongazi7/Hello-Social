import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/services/internet_service.dart';
import 'package:meetmax/res/widgets/no_internet_dialog.dart';

class ConnectivityWrapper extends StatelessWidget {
  final Widget child;

  const ConnectivityWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GetX<InternetService>(
      builder: (controller) {
        if (controller.isConnected.value) {
          return child;
        } else {
          return const NoInternetDialog();
        }
      },
    );
  }
}
