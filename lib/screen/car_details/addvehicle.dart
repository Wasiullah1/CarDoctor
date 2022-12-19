import 'package:cardoctor/components/button.dart';
import 'package:cardoctor/screen/car_details/basicinfo.dart';
import 'package:flutter/material.dart';

import '../../res/color.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key});

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
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
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, top: 40),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child:
                                    Image.asset("assets/images/mechanic.jpg")),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "No Vehicle is Added to Garage",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Add your car to maintain the log sheet",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.primaryColor),
                            ),
                            SizedBox(height: 10),
                            RoundButton(
                                title: "Add Vehicle Now",
                                onPress: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BasicInfo()));
                                })
                          ],
                        ),
                      ),
                    )
                  ]))
        ]));
  }
}
