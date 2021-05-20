
import 'package:flutter/material.dart';


class ShoeModel {
  final int id;
  final String name;
  final int price;
  final String desc;
  final Color colors;
  final String brand;
  final String imgPath;
  final String nameImg;
  final List size;
  int quantity;
  ShoeModel({
    this.id,
    this.name,
    this.price,
    this.desc,
    this.colors,
    this.brand,
    this.imgPath,
    this.nameImg,
    this.size,
    this.quantity
  });

  static List<ShoeModel> list = [
    ShoeModel(
      id: 1,
      name: "Nike Air Jordan",
      desc:
      "Familiar but always fresh, the iconic Air Jordan  is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      price: 184,
      colors: Colors.blue,
      brand: "NIKE",
      imgPath: "shoes6.png",
      nameImg: "shoes6",
      size:[
        "Try it",
        "7.5",
        "8",
        "9.5",
        "10"
      ],
      quantity: 1
    ),
    ShoeModel(
      id: 2,
      name: "Nike Air Max125",
      desc:
      "Familiar but always fresh, the iconic Air MAX is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      price: 135,
      colors: Colors.red,
      brand: "NIKE",
      imgPath: "shoes8.png",
      nameImg: "shoes7",
        size:[
          "Try it",
          "7.5",
          "8",
          "9.5",
          "10"
        ],
      quantity: 1

    ),
    ShoeModel(
      id:3,
      name: "Nike AIR OPI789",
      desc:
      "Familiar but always fresh, the iconic Air OPI is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      price: 123,
      colors: Colors.deepPurple,
      brand: "NIKE",
      imgPath: "shoes7.png",
      nameImg: "shoes8",
        size:[
          "Try it",
          "7.5",
          "8",
          "9.5",
          "10"
        ],
      quantity: 1
    ),
  ];
}