import 'dart:async';
import 'dart:developer' as developer;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meetmax/res/widgets/no_internet_dialog.dart';

class InternetService extends GetxController {
  static final InternetService _singleton = InternetService._internal();

  InternetService._internal();

  static InternetService get instance => _singleton;

  final _connectivity = Connectivity();
  final RxBool isConnected = false.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    _checkInitialConnection();
  }

  Future<void> _checkInitialConnection() async {
    try {
      final connectivityResults = await _connectivity.checkConnectivity();
      _updateConnectionStatus(connectivityResults);
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
    }
  }

  Future<bool> hasInternet() async {
    return isConnected.value;
  }

  void _updateConnectionStatus(List<ConnectivityResult> connectivityResults) {
    final connectivityResult = connectivityResults.isNotEmpty
        ? connectivityResults.first
        : ConnectivityResult.none;
    isConnected.value = (connectivityResult != ConnectivityResult.none);

    if (Get.context != null) {
      if (!isConnected.value) {
        if (!(Get.isDialogOpen ?? false)) {
          Get.dialog(
            NoInternetDialog(
              onCheckAgain: () {
                Get.back();
                _checkInitialConnection();
              },
            ),
            barrierDismissible: false,
          );
        }
      } else {
        if (Get.isDialogOpen ?? false) {
          Get.back();
        }
      }
    }
  }
}
