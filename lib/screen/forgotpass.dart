import 'package:cardoctor/res/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../components/button.dart';


class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;
  bool load = false;
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 70.0, left: 50.0, right: 50, bottom: 100),
            child: Image.asset("assets/images/logo.png"),
          ),
          Text("Forgot Password",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextTextColor)),
          SizedBox(height: 10),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
            child: Column(children: [
              Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          hintText: "Email",
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email),
                        ),
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) return "Email is required*";

                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                          RegExp regex = RegExp(pattern.toString());

                          if (!regex.hasMatch(value.trim())) {
                            return "Email address is not valid";
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 70.0, vertical: 5),
                child: RoundButton(
                    title: "Recover Password",
                    onPress: () async {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          load = false;
                        });
                        try {
                          _auth
                              .sendPasswordResetEmail(
                                  email: emailController.text.toString())
                              .then((value) {
                            setState(() {
                              load = false;
                            });
                            toastMessage(
                                'Please Check your email, a reset link has been sent to your email');
                          }).onError((error, stackTrace) {
                            toastMessage(error.toString());
                            setState(() {
                              load = false;
                            });
                          });
                        } catch (e) {
                          print(e.toString());
                          toastMessage(e.toString());
                        }
                      }
                    }),
              ),
              SizedBox(height: 40),
            ]),
          ),
        ])));
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

  Future<void> signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  // CurrentAppUser.currentUserData
                  //     .getCurrentUserData(uid.user!.uid),
                  Fluttertoast.showToast(msg: "Login Successful"),
                
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
  }
}
