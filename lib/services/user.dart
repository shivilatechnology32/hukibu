import 'dart:developer';
import 'package:get/get.dart';
import 'package:hukibu/API/api_client.dart';

import '../model/user_model.dart';
import '../routes/route_paths.dart';
import '../services/storage.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  final _isLogin = false.obs;
  String uid = '';
  String userIdKey = 'userIdKey';
  final _profile = UserModel(
    uid: '',
    image: '',
    email: '',
    phonenumber: '',
    username: '',
  ).obs;

  bool get isLogin => _isLogin.value;

  UserModel get profile => _profile.value;

  bool get hasToken => uid.isNotEmpty;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getProfile();
  }

  Future<void> setToken(String value) async {
    await StorageService.to.setString(userIdKey, value);
    uid = value;
  }

  Future<void> getProfile() async {
    uid = StorageService.to.getString(userIdKey);
    if (uid.isNotEmpty) {
      Response res = await ApiClient.to.postData(
        'http://35.78.201.111:4000/user/get/$uid',
        {},
      );
      _profile(UserModel.fromMap(res.body));
    }
    log('user data: $_profile');
    _isLogin.value = true;
  }

  Future<void> saveProfile(String profile) async {
    await StorageService.to.setString(userIdKey, profile);
    await getProfile();
    uid = profile;
    log("data is saved: ${_profile.value}");
  }

  Future<void> onLogout() async {
    await StorageService.to.remove(userIdKey);
    _isLogin.value = false;
    uid = '';
    Get.offAllNamed(RoutePaths.loginScreen);
  }
}
