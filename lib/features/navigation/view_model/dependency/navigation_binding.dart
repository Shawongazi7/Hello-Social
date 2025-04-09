import 'package:get/get.dart';
import 'package:meetmax/features/navigation/view_model/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());
  }
}
