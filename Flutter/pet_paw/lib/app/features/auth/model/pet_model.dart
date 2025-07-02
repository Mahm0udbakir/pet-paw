import 'package:flutter/material.dart';

enum NeuterStatus { intact, neutered }

enum Gender { male, female }

class PetModel {
  String name;
  String type;
  String breed;
  Color color;
  DateTime birthDay;
  double weight;
  String medicalConditions;

  PetModel({
    required this.name,
    required this.type,
    required this.breed,
    required this.color,
    required this.birthDay,
    required this.weight,
    required this.medicalConditions,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      name: json['name'],
      type: json['type'],
      breed: json['breed'],
      color: Color(json['color']),
      birthDay: DateTime.parse(json['birthDay']),
      weight: json['weight'],
      medicalConditions: json['medicalConditions'],
    );
  }
}
