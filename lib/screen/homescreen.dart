import 'dart:io';
import 'package:cardoctor/Models/current_aap_user.dart';
import 'package:cardoctor/components/button.dart';
import 'package:cardoctor/res/color.dart';
import 'package:cardoctor/screen/car_details/addvehicle.dart';
import 'package:cardoctor/screen/drawer.dart';
import 'package:cardoctor/screen/mechanic_details/findmechanic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  // final postRef = FirebaseDatabase.instance.reference().child("Posts");
  // firebase_storage.FirebaseStorage storage =
  //     firebase_storage.FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  File? _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 40, left: 140),
            child: Image.asset("assets/images/logo.png"),
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        drawer: MyDrawer(),
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("assets/images/mechanic.jpg")),
                        SizedBox(
                          height: 10,
                        ),
                        RoundButton(
                            title: 'Car details',
                            onPress: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddVehicle())))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.only(
                      left: 25, right: 25, top: 20, bottom: 30),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("assets/images/mechanic.jpg")),
                        SizedBox(
                          height: 10,
                        ),
                        RoundButton(
                            title: 'Car Mechanic',
                            onPress: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FindMechanic())))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
