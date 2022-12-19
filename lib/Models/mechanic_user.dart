import 'package:cloud_firestore/cloud_firestore.dart';

class MechanicUser {
  String? uid;
  String? email;
  String? name;
  String? image;
  String? role;
  Timestamp? createdAt;
  String? catagory;
  String? phone;
  String? city;

  MechanicUser({
    this.uid,
    this.email,
    this.name,
    this.createdAt,
    this.image,
    this.role,
    this.catagory,
    this.city,
    this.phone,
  });

  // receiving data from server
  static MechanicUser fromMap(Map<String, dynamic> map) {
    return MechanicUser(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      createdAt: map['created_at'],
      image: map['image'],
      role: map['role'],
      catagory: map['catagory'],
      city: map['city'],
      phone: map['phone'],
    );
  }

  // sending data to our server
  static Map<String, dynamic> toMap(MechanicUser userMechanic) {
    return {
      'uid': userMechanic.uid,
      'email': userMechanic.email,
      'name': userMechanic.name,
      'created_at': Timestamp.now(),
      'image': userMechanic.image,
      'shopName': userMechanic.catagory,
      'role': userMechanic.role,
      'city': userMechanic.city,
      'phone': userMechanic.phone,
    };
  }
}
