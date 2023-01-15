import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Mechanic {
  final String id;
  final String? name;
  final String? profession;
  final String? city;
  final String? image;
  final String? address;
  final String? contact;

  Mechanic(
      {required this.id,
      required this.name,
      required this.profession,
      required this.city,
      required this.image,
      required this.contact,
      required this.address});

  static Mechanic fromMap(Map data) {
    return Mechanic(
        id: data['uid'],
        name: data['name'],
        profession: data['role'],
        city: data['city'],
        image: data['image'],
        contact: data['phone'],
        address: data['address'] ?? data['city']);
  }

  static List<Mechanic> mechanicmodel() => [
        Mechanic(
            id: '0',
            name: "Arslan",
            profession: "Electrician",
            city: "Shikarpur",
            image: "assets/images/arslan1.jpg",
            contact: "+923003433317",
            address: "Shop1 Mirani Muhalla near Haider Bakers Shikarpur"),
        Mechanic(
            id: '1',
            name: "Ustad Mistri",
            profession: "Mechanic",
            city: "Shikarpur",
            image: "assets/images/mechanic.jpg",
            contact: "+923003300303",
            address: "Shop1 Mirani Muhalla near Haider Bakers Shikarpur"),
        Mechanic(
            id: '2',
            name: "Ustad Arslan",
            profession: "Wiring",
            city: "Golo Dharo",
            image: 'assets/images/arslan1.jpg',
            contact: "+923003433317",
            address: "Shop1 Mirani Muhalla near Haider Bakers Shikarpur"),
        Mechanic(
            id: '3',
            name: "Ustad Shaikh Sahb",
            profession: "Electrician",
            city: "Shikarpur",
            image: 'assets/images/arslan1.jpg',
            contact: "03003300303",
            address: "Shop1 Mirani Muhalla near Haider Bakers Shikarpur"),
        Mechanic(
            id: '4',
            name: "Myself",
            profession: "Electrician",
            city: "Shikarpur",
            image: 'assets/images/mechanic.jpg',
            contact: "+923320325410",
            address: "Main Circular Road Siddique Mari Shikarpur"),
        Mechanic(
            id: '5',
            name: "Ustad Shaikh Sahb",
            profession: "Electrician",
            city: "Shikarpur",
            image: 'assets/images/arslan1.jpg',
            contact: "03003300303",
            address: "Shop1 Mirani Muhalla near Haider Bakers Shikarpur"),
      ];
}
