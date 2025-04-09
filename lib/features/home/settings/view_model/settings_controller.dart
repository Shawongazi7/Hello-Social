import 'package:get/get.dart';
import 'package:meetmax/res/routes/routes_name.dart';
import 'package:meetmax/services/loading_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  final loading = Loading.instance();

  onPressedLogout() async {
    loading.show();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('authToken'); // Get the token
    if (authToken != null && authToken.isNotEmpty) {
      prefs.remove('authToken');
    }
    loading.hide();
    Get.offAllNamed(RoutesName.signInScreen);
  }
}
