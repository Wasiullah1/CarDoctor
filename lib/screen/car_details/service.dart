import 'package:cardoctor/components/button.dart';
import 'package:cardoctor/res/color.dart';
import 'package:flutter/material.dart';

class ServiceCategory extends StatefulWidget {
  const ServiceCategory({super.key});

  @override
  State<ServiceCategory> createState() => _ServiceCategoryState();
}

class _ServiceCategoryState extends State<ServiceCategory> {
  TextEditingController cost = TextEditingController();
  TextEditingController mileage = TextEditingController();
  String dropdownvalue1 = 'dd/mm/yyyy';

  var date = [
    'dd/mm/yyyy',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text("SERVICE CATEGORY"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Icon(Icons.emoji_transportation,
            //         color: AppColors.primaryIconColor, size: 30),
            //     SizedBox(
            //       width: 30,
            //     ),
            //     Text(
            //       "SERVICE",
            //       style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 25.0,
            //           color: AppColors.primaryIconColor),
            //     ),
            //   ],
            // ),
            Padding(
              padding: EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Container(
                height: 500.0,
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
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Colors.grey.shade400,
                          ),
                          Text(
                            "SERVICE DATE",
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
                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: AppColors.primaryTextTextColor,
                            border: Border.all(color: Colors.black38, width: 3),
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.57),
                                  blurRadius: 5)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(20),
                            focusColor: Colors.white,
                            value: dropdownvalue1,
                            icon: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Icon(Icons.arrow_circle_down_sharp)),
                            iconEnabledColor: AppColors.primaryColor,
                            style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 20),
                            items: date.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue1 = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.currency_rupee_sharp,
                            color: Colors.grey.shade400,
                          ),
                          Text(
                            "COST (PKR)",
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
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: TextFormField(
                          controller: cost,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'required';
                            } else
                              return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.currency_rupee_sharp),
                              hintText: 'Cost',
                              labelText: 'Cost',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              hintStyle: TextStyle(
                                color: AppColors.hintColor,
                                fontWeight: FontWeight.normal,
                              ),
                              labelStyle: TextStyle(
                                  color: AppColors.hintColor,
                                  fontWeight: FontWeight.normal)),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.social_distance,
                            color: Colors.grey.shade400,
                          ),
                          Text(
                            "CURRENT MILEAGE (KM)",
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
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: TextFormField(
                          controller: mileage,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'required';
                            } else
                              return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.social_distance),
                              hintText: 'Enter Current Mileage',
                              labelText: 'Enter Current Mileage',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              hintStyle: TextStyle(
                                color: AppColors.hintColor,
                                fontWeight: FontWeight.normal,
                              ),
                              labelStyle: TextStyle(
                                  color: AppColors.hintColor,
                                  fontWeight: FontWeight.normal)),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Colors.grey.shade400,
                          ),
                          Text(
                            "NEXT SERVICE DATE",
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
                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: AppColors.primaryTextTextColor,
                            border: Border.all(color: Colors.black38, width: 3),
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.57),
                                  blurRadius: 5)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(20),
                            focusColor: Colors.white,
                            value: dropdownvalue1,
                            icon: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Icon(Icons.arrow_circle_down_sharp)),
                            iconEnabledColor: AppColors.primaryColor,
                            style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 20),
                            items: date.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue1 = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: RoundButton(title: "Save", onPress: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
