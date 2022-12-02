import 'package:cardoctor/Models/current_aap_user.dart';
import 'package:cardoctor/components/button.dart';
import 'package:cardoctor/res/color.dart';
import 'package:cardoctor/screen/forgotpass.dart';
import 'package:cardoctor/screen/homescreen.dart';
import 'package:cardoctor/screen/signupscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;
  bool load = false;
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 70.0, left: 50.0, right: 50, bottom: 50),
              child: Image.asset("assets/images/logo.png"),
            ),
            Text("Login",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryTextTextColor)),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'required';
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Email',
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
                    controller: passwordController,
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
                      hintText: 'Passwaord',
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPass(),
                          )),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: AppColors.primaryTextTextColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 70.0, vertical: 20),
              child: RoundButton(
                  title: "Login",
                  onPress: () async {
                    await signIn(emailController.text, passwordController.text);
                  }),
            ),
            SizedBox(height: 40),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'Don\'t have an account?  ',
                    style: TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).colorScheme.onBackground)),
                TextSpan(
                    text: 'Create',
                    style: TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen()));
                      }),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signIn(String email, String password) async {
    print("Validated");

    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                CurrentAppUser.currentUserData
                    .getCurrentUserData(uid.user!.uid),
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen())),
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
