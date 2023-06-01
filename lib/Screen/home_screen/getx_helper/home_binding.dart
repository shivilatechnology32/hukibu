import 'package:get/get.dart';
import 'package:hukibu/Screen/home_screen/getx_helper/home_controller.dart';

class HomeBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }

}