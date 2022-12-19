import 'dart:io';

import 'package:badges/badges.dart';
import 'package:cardoctor/res/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final ref = FirebaseDatabase.instance.ref('users');

  File? _image;
  final picker = ImagePicker();
  Future getCameraImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("No Image Selected");
      }
    });
  }

  Future getGalleryImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("No Image Selected");
      }
    });
  }

  void dialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Container(
              height: 120,
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        getCameraImage();
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        leading: Icon(Icons.camera_alt),
                        title: Text("Camera"),
                      )),
                  InkWell(
                      onTap: () {
                        getGalleryImage();
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        leading: Icon(Icons.photo_library),
                        title: Text("Gallery"),
                      ))
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Badge(
                        badgeColor: Colors.white70,
                        position: BadgePosition.bottomEnd(),
                        badgeContent: InkWell(
                          onTap: () => dialog(context),
                          child: Icon(
                            Icons.camera_alt,
                            // color: Colors.grey.shade500,
                            size: 30.0,
                          ),
                        ),
                        child: Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColors.primaryColor, width: 5)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image(
                                image: NetworkImage(
                                    'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                      child: CircularProgressIndicator());
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    child: Icon(
                                      Icons.error_outline,
                                      color: Colors.red,
                                    ),
                                  );
                                }),
                          ),
                        ),
                      )),
                    ]))));

    // StreamBuilder(
    //   stream: ref.child(SessionController().userID.toString()).onValue,
    //   builder: (context, AsyncSnapshot snapshot) {
    //     if (!snapshot.hasData) {
    //       return Center(child: CircularProgressIndicator());
    //     } else if (snapshot.hasData) {
    //       return
    //             ),
    //           ]);
  }
  void toastMessage(String message) {
  Fluttertoast.showToast(
      msg: message.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
}
