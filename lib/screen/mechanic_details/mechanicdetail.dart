import 'dart:io';

import 'package:cardoctor/res/color.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Models/mechanic.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class MechanicDetail extends StatefulWidget {
  int id;
  MechanicDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<MechanicDetail> createState() => _MechanicDetailState(id);
}

class _MechanicDetailState extends State<MechanicDetail> {
  final mechanic = Mechanic.mechanicmodel();
  int id;
  _MechanicDetailState(this.id);

  void launchWhatsApp({
    required int phone,
    required String message,
  }) async {
    String url() {
      if (Platform.isAndroid) {
        return "https://wa.me/$phone/?text=${Uri.parse(message)}";
      } else {
        return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}";
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  void launchUrl(String url) async {
    launchUrl("tel:+99364921507");

    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Stack(children: [
          Positioned(
              top: 50,
              left: 10,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              )),
          Center(
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Stack(alignment: Alignment.topCenter, children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                        top: 160 / 2.0,
                      ),
                      child: Container(
                        height: 350.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: AppColors.successColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8.0,
                              offset: Offset(0.0, 5.0),
                            ),
                          ],
                        ),
                        width: double.infinity,
                        child: Padding(
                            padding:
                                const EdgeInsets.only(top: 15.0, bottom: 15.0),
                            child: Column(children: <Widget>[
                              SizedBox(
                                height: 160 / 2,
                              ),
                              Text(
                                mechanic[id].name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 34.0,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                mechanic[id].profession,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0,
                                    color: Color.fromARGB(255, 255, 0, 0)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.grey.shade400,
                                  ),
                                  Text(
                                    mechanic[id].city,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        color: Colors.grey.shade400),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  mechanic[id].address,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: Colors.grey.shade400),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        color: Colors.grey.shade400,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        mechanic[id].contact,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                            color: Colors.grey.shade400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ])),
                      )),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8.0,
                          offset: Offset(0.0, 5.0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Container(
                        child: ClipOval(
                          child: Image.asset(
                            mechanic[id].image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ])),
          ),
          Positioned(
            bottom: 50,
            right: 20,
            child: FloatingActionButton(
                backgroundColor: AppColors.whatsapp,
                onPressed: () {
                  launchWhatsApp(
                      phone: int.parse("${mechanic[id].contact}"),
                      message: 'Hello');
                },
                child: const Icon(Icons.whatsapp)),
          ),
          Positioned(
            bottom: 50,
            right: 90,
            child: FloatingActionButton(
                backgroundColor: AppColors.dial,
                onPressed: () async {
                  FlutterPhoneDirectCaller.callNumber(
                      "${mechanic[id].contact}");
                },
                child: const Icon(Icons.phone)),
          ),
        ]));
  }
}
