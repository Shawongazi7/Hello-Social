import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/res/colors/app_colors.dart';
import 'package:meetmax/res/routes/app_routes.dart';
import 'package:meetmax/res/routes/routes_name.dart';
import 'package:meetmax/features/navigation/view_model/navigation_controller.dart';
import 'package:meetmax/services/internet_service.dart';
import 'package:meetmax/services/loading_service.dart';
import 'package:meetmax/utils/connectivity_wrapper.dart';
import 'package:toastification/toastification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize services
  await Get.putAsync(() async => InternetService.instance);
  await Get.putAsync(() async => NavigationController());

  runApp(const MeetMax());
}

class MeetMax extends StatelessWidget {
  const MeetMax({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: LoadingInit(
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Meetmax',
            theme: ThemeData(
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: AppColors.blue,
                selectionColor: AppColors.blue.withOpacity(0.2),
                selectionHandleColor: AppColors.blue.withOpacity(0.8),
              ),
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: RoutesName.splashScreen,
            getPages: AppRoutes.appRoutes(),
            builder: LoadingTransitionBuilder(
              builder: (context, child) {
                // Wrap MediaQuery and ConnectivityWrapper around the loading overlay
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: ConnectivityWrapper(child: child!),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
