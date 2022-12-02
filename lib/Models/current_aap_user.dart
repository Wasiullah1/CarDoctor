import 'package:cardoctor/Models/app_user.dart';
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
