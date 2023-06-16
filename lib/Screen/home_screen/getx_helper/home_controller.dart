import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hukibu/Screen/home_screen/getx_helper/home_state.dart';
import 'package:image_picker/image_picker.dart';

import '../../../API/api_client.dart';
import '../../../model/app_data/child_model.dart';
import '../../../services/user.dart';

class HomeController extends GetxController {

  HomeState state = HomeState();
  Rx<String> image = ''.obs;
  Rx<String> imageURL = ''.obs;
  Rx<bool> isSwitched = false.obs;
  final searchController = TextEditingController();

  @override
  Future<void> onInit() async {
    await getData();
    super.onInit();
  }

  Future<void> getData() async {
    Response res = await ApiClient.to.getData(
      'http://35.78.201.111:4000/children/get/${UserStore.to.uid}'
    );
    for(var child in res.body){
      state.childList.add(ChildModel.fromJson(res.body));
    }
  }

  void toggleSwitch(bool value) {
    if (isSwitched.value == false) {
      isSwitched.value = true;

    } else {
      isSwitched.value = false;

    }
  }

  Future<void> changeLocale(BuildContext context) async {
    if (isSwitched.value) {
      context.setLocale(const Locale('en', 'US'));
    } else {
      context.setLocale(const Locale('tr', 'TR'));
    }
    update();
  }

  getImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      image.value = pickedFile.path;
      Response res = await ApiClient.to.postData(
        'http://35.78.201.111:4000/user/upload-profile/${UserStore.to.uid}',
        {},
      );
    }
  }

  bottomSheet() {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              getImageFromGallery();
              Get.back();
            },
            child: const ListTile(
              leading: Icon(Icons.image),
              title: Text('Gallery'),
            ),
          ),
        ],
      ),
    );
  }

}