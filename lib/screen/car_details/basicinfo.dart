import 'package:cardoctor/Models/current_aap_user.dart';
import 'package:cardoctor/components/button.dart';
import 'package:cardoctor/res/color.dart';
import 'package:cardoctor/screen/car_details/service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BasicInfo extends StatefulWidget {
  const BasicInfo({super.key});

  @override
  State<BasicInfo> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  DateTime selectedDate = DateTime.now();
  String rideType = '';
  String makeModel = '';

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text("Basic Information"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.car_rental_sharp),
                ),
                hint: Text('Ride type'),
                items: <String>['Car', 'Bike'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {
                  setState(() {
                    rideType = _!;
                  });
                },
              ),
              SizedBox(height: 30),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_month),
                ),
                hint: Text('Select Year'),
                items: <String>[
                  '2022',
                  '2021',
                  '2020',
                  '2019',
                  '2018',
                  '2017',
                  '2016',
                  '2015',
                  '2014',
                  '2013',
                  '2012',
                  '2011',
                  '2010',
                  '2009',
                  '2008',
                  '2007',
                  '2006',
                  '2005',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {
                  setState(() {
                    makeModel = _!;
                  });
                },
              ),
              SizedBox(height: 30),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.car_rental_sharp),
                ),
                hint: Text('Select Make Model'),
                items: <String>[
                  'Alto',
                  'City',
                  'Civic',
                  'Cultus',
                  'Corrolla',
                  'Bollan'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {
                  setState(() {
                    makeModel = _!;
                  });
                },
              ),
              SizedBox(height: 30),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.car_rental_sharp),
                ),
                hint: Text('Ride type'),
                items: <String>['Car', 'Bike'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {
                  setState(() {
                    rideType = _!;
                  });
                },
              ),
              SizedBox(height: 30),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.car_rental_sharp),
                ),
                hint: Text('Ride type'),
                items: <String>['Car', 'Bike'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {
                  setState(() {
                    rideType = _!;
                  });
                },
              ),
              SizedBox(height: 30),
              RoundButton(
                  title: "Next",
                  onPress: () async {
                    final uid = CurrentAppUser.currentUserData.uid ??
                        CurrentMechanicUser.currentUserMechanicData.uid;
                    if (rideType == null ||
                        rideType.isEmpty ||
                        makeModel == null ||
                        makeModel.isEmpty ||
                        selectedDate == null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please fill all the fields")));
                      return;
                    } else if (uid == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please login first")));
                      return;
                    } else {
                      var docId =
                          DateTime.now().millisecondsSinceEpoch.toString();
                      var doc = await FirebaseFirestore.instance
                          .collection('garage')
                          .doc(uid)
                          .collection('cars')
                          .doc(docId)
                          .set({
                        'rideType': rideType,
                        'makeModel': makeModel,
                        'selectedDate': selectedDate,
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ServiceCategory(
                                    carId: docId,
                                  )));
                    }
                  })
            ],
          ),
        ));
  }
}
