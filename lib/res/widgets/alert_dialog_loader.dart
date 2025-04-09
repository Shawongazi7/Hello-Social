import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meetmax/res/keys/app_keys.dart';

class AlertDialogLoader {
  AlertDialogLoader._();

  static load({
    required Widget dialog,
    bool isDismissible = true,
  }) {
    Navigator.of(AppKeys.navigation.currentContext!).push(
      PageRouteBuilder(
        opaque: false,
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (BuildContext context, _, __) {
          return WillPopScope(
            onWillPop: () async {
              return isDismissible;
            },
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 0,
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  systemNavigationBarColor: Colors.transparent,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.dark,
                  statusBarIconBrightness: Brightness.dark,
                  statusBarBrightness: Brightness.dark,
                ),
              ),
              backgroundColor: Colors.black26,
              body: Container(
                height: MediaQuery.of(AppKeys.navigation.currentContext!)
                    .size
                    .height,
                width: MediaQuery.of(AppKeys.navigation.currentContext!)
                    .size
                    .width,
                alignment: Alignment.center,
                child: dialog,
              ),
            ),
          );
        },
      ),
    );
  }
}
