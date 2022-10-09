import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
class Pizza  extends Equatable{
  final String id;
  final Image image;
  final String name;

  const Pizza({
    required this.id,required this.name,required this.image
});

  @override
  List<Object?> get props =>[id,name,image];

  static List<Pizza> pizzas = [
    Pizza(id: '0', name: "Special Pizza", image: Image.asset("assets/images/peperoni_2.png")),
    Pizza(id: '1', name: "Peperoni", image: Image.asset("assets/images/peperoni.png"))
  ];
}