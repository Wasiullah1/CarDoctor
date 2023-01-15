import 'dart:io';
import 'package:badges/badges.dart';
import 'package:cardoctor/Models/current_aap_user.dart';
import 'package:cardoctor/components/button.dart';
import 'package:cardoctor/res/color.dart';
import 'package:cardoctor/screen/loginscreen.dart';
import 'package:cardoctor/screen/profilescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? name;
  String? email;
  String? name1;
  String? email1;
  @override
  void initState() {
    super.initState();
    name = CurrentAppUser.currentUserData.name ?? "";
    email = CurrentAppUser.currentUserData.email ?? "";
    name1 = CurrentMechanicUser.currentUserMechanicData.name ?? "";
    email1 = CurrentMechanicUser.currentUserMechanicData.email ?? "";
    setState(() {});
  }

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return _buildDrawer();
  }

  _buildDrawer() {
    final String image = CurrentAppUser.currentUserData.image ??
        CurrentMechanicUser.currentUserMechanicData.image ??
        "https://firebasestorage.googleapis.com/v0/b/cardoctor-1f2c7.appspot.com/o/images%2Fdefault.png?alt=media&token=0b0b0b0b-0b0b-0b0b-0b0b-0b0b0b0b0b0b";
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 40),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [BoxShadow(color: Colors.black45)]),
        width: 300,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(
                    Icons.power_settings_new,
                    color: AppColors.grayColor,
                  ),
                  onPressed: () async {
                    await logout(context);
                  },
                ),
              ),
              Container(
                height: 90,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      AppColors.primaryColor,
                      AppColors.secondaryColor
                    ])),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(image),
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                " $name $name1",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "$email $email1",
                style: TextStyle(color: AppColors.grayColor, fontSize: 16.0),
              ),
              SizedBox(height: 30.0),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: _buildRow(Icons.home, "Home")),
              _buildDivider(),
              InkWell(
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()))
                        .then((value) => setState(() {}));
                  },
                  child: _buildRow(Icons.person_pin, "My profile")),
              _buildDivider(),
              _buildRow(Icons.settings, "Settings"),
              _buildDivider(),
              _buildRow(Icons.email, "Contact us"),
              _buildDivider(),
              _buildRow(Icons.info_outline, "Help"),
              _buildDivider(),
            ],
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: AppColors.lightGrayColor,
    );
  }

  Widget _buildRow(IconData icon, String title, {bool showBadge = false}) {
    final TextStyle tStyle =
        TextStyle(color: AppColors.grayColor, fontSize: 16.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(children: [
        Icon(
          icon,
          color: AppColors.grayColor,
        ),
        SizedBox(width: 10.0),
        Text(
          title,
          style: tStyle,
        ),
        Spacer(),
        // if (showBadge)
        //   Material(
        //     color: Colors.deepOrange,
        //     elevation: 5.0,
        //     shadowColor: Colors.red,
        //     borderRadius: BorderRadius.circular(5.0),
        //     child: Container(
        //       width: 25,
        //       height: 25,
        //       alignment: Alignment.center,
        //       decoration: BoxDecoration(
        //         color: Colors.deepOrange,
        //         borderRadius: BorderRadius.circular(5.0),
        //       ),
        //       child: Text(
        //         "10+",
        //         style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 12.0,
        //             fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //   )
      ]),
    );
  }
}

// ListView(
//   children: [
//     Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 5),
//         child: Container(
//           color: Colors.blue.shade200,
//           child: Column(children: [
//             SizedBox(height: 20),
//             Badge(
//                 badgeColor: Colors.white70,
//                 position: BadgePosition.bottomEnd(),
//                 badgeContent: InkWell(
//                   onTap: () => dialog(context),
//                   child: Icon(
//                     Icons.camera_alt,
//                     // color: Colors.grey.shade500,
//                     size: 30.0,
//                   ),
//                 ),
//                 child: Container(
//                     // height: MediaQuery.of(context).size.height * .3,
//                     // width: MediaQuery.of(context).size.width * .3,
//                     child: _image != null
//                         ? SizedBox(
//                             height: 140,
//                             width: 140,
//                             child: CircleAvatar(
//                                 backgroundColor: Colors.black,
//                                 child: SizedBox(
//                                     width: 130,
//                                     height: 130,
//                                     child: ClipOval(
//                                       child: Image.file(
//                                         _image!.absolute,
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ))),
//                           )
//                         : SizedBox(
//                             height: 140,
//                             width: 140,
//                             child: CircleAvatar(
//                               backgroundColor: Colors.black,
//                             ),
//                           ))),
//             SizedBox(height: 10),
//             Text(
//               " $name $name1",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "$email $email1",
//               textAlign: TextAlign.left,
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             ),
//             SizedBox(height: 10),
//           ]),
//         )),
//     ListTile(
//       leading: Icon(
//         Icons.home,
//       ),
//       title: const Text('Home'),
//       onTap: () {
//         Navigator.pop(context);
//       },
//     ),
//     ListTile(
//       leading: Icon(
//         Icons.person,
//       ),
//       title: const Text('Profile'),
//       onTap: () {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => ProfileScreen()));
//       },
//     ),
//     ListTile(
//       leading: Icon(
//         Icons.settings,
//       ),
//       title: const Text('Settings'),
//       onTap: () {
//         Navigator.pop(context);
//       },
//     ),
//     Padding(
//       padding: const EdgeInsets.only(
//         left: 30,
//         right: 30,
//         top: 300,
//       ),
//       child: Align(
//         alignment: Alignment.bottomCenter,
//         child: RoundButton(
//           title: "Logout",
//           onPress: () async {
//             await logout(context);
//           },
//         ),
//       ),
//     ),
//   ],
// ),

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
