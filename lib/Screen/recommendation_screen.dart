// ignore_for_file: unnecessary_import, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hukibu/model/firestore_mothods.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class RecommendationScreen extends StatefulWidget {
  const RecommendationScreen({Key? key}) : super(key: key);

  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  var _image;
  var video;
  String imageUrl = '';
  String videoUrl = '';
  bool isComplete = false;
  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final file = await imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      _image = await file.readAsBytes();
      setState(() {});
    }
  }

  Future<void> pickVideo() async {
    final imagePicker = ImagePicker();
    final file = await imagePicker.pickVideo(source: ImageSource.gallery);
    if (file != null) {
      video = await file.readAsBytes();
    }
  }

  final description = TextEditingController();
  @override
  void dispose() {
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isComplete
        ? Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator().centered(),
                  20.heightBox,
                  "Sending....".text.white.bold.size(30).make().centered(),
                ],
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: "Recommendation".text.make(),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: description,
                    maxLines: null,
                    minLines: 10,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Description...",
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.video_camera_back_outlined),
                      5.widthBox,
                      "Add a video".text.make()
                    ],
                  ).box.padding(const EdgeInsets.all(12)).make().onTap(() {
                    pickVideo();
                  }),
                  Row(
                    children: [
                      const Icon(Icons.photo),
                      5.widthBox,
                      "Add a photo".text.make()
                    ],
                  ).box.padding(const EdgeInsets.all(12)).make().onTap(() {
                    pickImage();
                  }),
                  20.heightBox,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(context.screenWidth * 0.7, 50),
                        backgroundColor: Vx.amber300,
                        foregroundColor: Colors.white),
                    onPressed: () async {
                      if (description.text.isNotEmpty) {
                        setState(() {
                          isComplete = true;
                        });
                        try {
                          if (_image != null) {
                            imageUrl = await FireStoreServices()
                                .uploadImageToStorage(
                                    'recommendations', _image);
                          }
                          if (video != null) {
                            videoUrl = await FireStoreServices()
                                .uploadVideoToStorage('recommendations', video);
                          }
                          await FireStoreServices.sendRecommendation(
                              description: description.text,
                              imageUrl: imageUrl,
                              videoUrl: videoUrl);
                          setState(() {
                            isComplete = false;
                          });
                          VxToast.show(context, msg: "Recommendation sent");
                          Navigator.pop(context);
                        } catch (e) {
                          VxToast.show(context, msg: e.toString());
                          setState(() {
                            isComplete = false;
                          });
                        }
                      } else {
                        VxToast.show(context, msg: "Description cant be empty");
                      }
                    },
                    child: "Send".text.size(20).bold.white.makeCentered(),
                  )
                ],
              ).p12(),
            ),
          );
  }
}
