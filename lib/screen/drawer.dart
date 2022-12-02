import 'dart:io';
import 'package:badges/badges.dart';
import 'package:cardoctor/Models/current_aap_user.dart';
import 'package:cardoctor/components/button.dart';
import 'package:cardoctor/screen/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  File? _image;
  final picker = ImagePicker();
  String? name;
  String? email;
  @override
  void initState() {
    super.initState();
    name = CurrentAppUser.currentUserData.name ?? "";
    email = CurrentAppUser.currentUserData.email ?? "";
    setState(() {});
  }

  bool showSpinner = false;
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
    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                SizedBox(height: 20),
                Badge(
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
                        // height: MediaQuery.of(context).size.height * .3,
                        // width: MediaQuery.of(context).size.width * .3,
                        child: _image != null
                            ? SizedBox(
                                height: 140,
                                width: 140,
                                child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: SizedBox(
                                        width: 130,
                                        height: 130,
                                        child: ClipOval(
                                          child: Image.file(
                                            _image!.absolute,
                                            fit: BoxFit.fill,
                                          ),
                                        ))),
                              )
                            : SizedBox(
                                height: 140,
                                width: 140,
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                ),
                              ))),
                SizedBox(height: 10),
                Text(
                  "$name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(height: 10),
                Text(
                  "$email",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(
                    Icons.home,
                  ),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                  ),
                  title: const Text('Settings'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 300,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RoundButton(
                      title: "Logout",
                      onPress: () async {
                        await logout(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginScreen()));
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
