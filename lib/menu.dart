
import 'package:flutter/material.dart';

class Food {
  final String name;
  final String image;
  final String harga;

  Food({required this.name, required this.image, required this.harga});
}

List<Food> dummyFoods = [
  Food(
    name: "Nasi Goreng",
    image: "assets/images/nasigoreng.jpg",
    harga: "50000",
  ),
  Food(
    name: "Mie Goreng",
    image: "assets/images/miegoreng.jpg",
    harga: "75000",
  ),
  Food(
    name: "Sate Ayam",
    image: "assets/images/sateayam.jpg",
    harga: "42000",
  ),
  Food(
    name: "Bakso",
    image: "assets/images/bakso.jpeg",
    harga: "33000",
  ),
];


