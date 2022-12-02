import 'package:cardoctor/Models/app_user.dart';
import 'package:cardoctor/components/button.dart';
import 'package:cardoctor/res/color.dart';
import 'package:cardoctor/screen/loginscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MechanicSignup extends StatefulWidget {
  const MechanicSignup({super.key});

  @override
  State<MechanicSignup> createState() => _MechanicSignupState();
}

class _MechanicSignupState extends State<MechanicSignup> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController contactcontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  String dropdownvalue = 'Engine Mechanic';

  var categories = [
    'Engine Mechanic',
    'Wiring Mechanic',
    'Denting & Painting',
    'Tire & Puncture',
    'AC Intercooler',
    'Wheel balancing'
  ];

  @override
  Widget build(BuildContext context) {
    print("11$dropdownvalue");
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 70.0, left: 50.0, right: 50, bottom: 25),
              child: Image.asset("assets/images/logo.png"),
            ),
            Text("Mechanic Sign up",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryTextTextColor)),
            
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    controller: namecontroller,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'required';
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Username',
                      labelText: 'Username',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'required';
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Emai',
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passwordcontroller,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'required';
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Password',
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: contactcontroller,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'required';
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: 'Contat',
                      labelText: 'Contact',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: citycontroller,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'required';
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_city),
                      hintText: 'City',
                      labelText: 'City',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ],
              )),
            ),
            Text("Mechanic Category",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryTextTextColor)),
            SizedBox(
              height: 8,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  color: AppColors.primaryTextTextColor,
                  border: Border.all(color: Colors.black38, width: 3),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.57), blurRadius: 5)
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: DropdownButton(
                  borderRadius: BorderRadius.circular(20),
                  focusColor: Colors.white,
                  value: dropdownvalue,
                  icon: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(Icons.arrow_circle_down_sharp)),
                  iconEnabledColor: AppColors.primaryColor,
                  style: TextStyle(
                      color: AppColors.secondaryTextColor, fontSize: 20),
                  items: categories.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 70.0, vertical: 5),
              child: RoundButton(
                  title: "Sign up",
                  onPress: () async {
                    await signUp(emailcontroller.text.toString(),
                        passwordcontroller.text.toString());
                  }),
            ),
          ]),
        ));
  }

  Future<void> signUp(String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
      print(error.code);
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    AppUser userModel = AppUser();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = namecontroller.text;
    userModel.phone = contactcontroller.text;
    userModel.city = citycontroller.text;
    userModel.role = dropdownvalue;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(AppUser.toMap(userModel));
    Fluttertoast.showToast(msg: "Account created successfully");
    Navigator.push((context),
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
