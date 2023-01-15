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
    // Automatically update data when edited on server

    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .snapshots()
          .listen((event) {
        Map<String, dynamic>? data = event.data();
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
      FirebaseFirestore.instance
          .collection('mechanic')
          .doc(mechanicId)
          .snapshots()
          .listen((event) {
        Map<String, dynamic>? data = event.data();
        CurrentMechanicUser.currentUserMechanicData.uid = mechanicId;
        CurrentMechanicUser.currentUserMechanicData.uid = data!['uid'] ?? '';
        CurrentMechanicUser.currentUserMechanicData.email = data['email'] ?? '';
        CurrentMechanicUser.currentUserMechanicData.name = data['name'] ?? '';
        CurrentMechanicUser.currentUserMechanicData.createdAt =
            data['created_at'] ?? '';
        CurrentMechanicUser.currentUserMechanicData.image = data['image'] ?? '';
        CurrentMechanicUser.currentUserMechanicData.role = data['role'] ?? '';
        CurrentMechanicUser.currentUserMechanicData.catagory =
            data['catagory'] ?? '';
        CurrentMechanicUser.currentUserMechanicData.city = data['city'];
        CurrentMechanicUser.currentUserMechanicData.phone = data['phone'] ?? '';
        CurrentMechanicUser.currentUserMechanicData.notifyListeners();
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
