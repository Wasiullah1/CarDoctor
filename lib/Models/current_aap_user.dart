import 'package:cardoctor/Models/app_user.dart';
import 'package:cardoctor/Models/mechanic_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CurrentAppUser extends AppUser with ChangeNotifier {
  static final CurrentAppUser _singleton = CurrentAppUser._internal();
  factory CurrentAppUser() => _singleton;
  CurrentAppUser._internal();
  static CurrentAppUser get currentUserData => _singleton;

  Future<bool> getCurrentUserData(String userId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get()
          .then((event) {
        print("HHere we got ::::: >>>>>>>");
        Map<String, dynamic>? data = event.data();
        print("HHere we got ::::: Map :: >>>>>>>$data ");
        CurrentAppUser.currentUserData.uid = userId;
        CurrentAppUser.currentUserData.uid = data!['uid'] ?? '';
        CurrentAppUser.currentUserData.email = data['email'] ?? '';
        CurrentAppUser.currentUserData.name = data['name'] ?? '';
        CurrentAppUser.currentUserData.createdAt = data['created_at'] ?? '';
        CurrentAppUser.currentUserData.image = data['image'] ?? '';
        CurrentAppUser.currentUserData.role = data['role'] ?? '';
        CurrentAppUser.currentUserData.catagory = data['catagory'] ?? '';
        CurrentAppUser.currentUserData.city = data['city'];
        CurrentAppUser.currentUserData.phone = data['phone'] ?? '';
        CurrentAppUser.currentUserData.notifyListeners();
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}

class CurrentMechanicUser extends MechanicUser with ChangeNotifier {
  static final CurrentMechanicUser singleton = CurrentMechanicUser._internal();
  factory CurrentMechanicUser() => singleton;
  CurrentMechanicUser._internal();
  static CurrentMechanicUser get currentUserMechanicData => singleton;

  Future<bool> getCurrentMechanicData(String mechanicId) async {
    try {
      await FirebaseFirestore.instance
          .collection('mechanic')
          .doc(mechanicId)
          .get()
          .then((event1) {
        print("HHere we got ::::: >>>>>>>");
        Map<String, dynamic>? data1 = event1.data();
        print("HHere we got ::::: Map :: >>>>>>>$data1 ");
        CurrentMechanicUser.currentUserMechanicData.uid = mechanicId;
        CurrentMechanicUser.currentUserMechanicData.uid = data1!['uid'] ?? '';
        CurrentMechanicUser.currentUserMechanicData.email =
            data1['email'] ?? '';
        CurrentMechanicUser.currentUserMechanicData.name = data1['name'] ?? '';
        CurrentMechanicUser.currentUserMechanicData.createdAt =
            data1['created_at'] ?? '';
        CurrentMechanicUser.currentUserMechanicData.image =
            data1['image'] ?? '';
        CurrentMechanicUser.currentUserMechanicData.role = data1['role'] ?? '';
        CurrentMechanicUser.currentUserMechanicData.catagory =
            data1['catagory'] ?? '';
        CurrentMechanicUser.currentUserMechanicData.city = data1['city'];
        CurrentMechanicUser.currentUserMechanicData.phone =
            data1['phone'] ?? '';
        CurrentMechanicUser.currentUserMechanicData.notifyListeners();
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
