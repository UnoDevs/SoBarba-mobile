// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:sobarba_mobile/domain/entities/employee_data.dart';

class Person {
  final int id;
  final String name;
  final String description;
  final String email;
  final String phone;
  final bool active;
  final String document;
  final List<String> personTypes;
  EmployeeData? employeeData;

  Person({
    required this.id,
    required this.name,
    required this.description,
    required this.email,
    required this.phone,
    required this.active,
    required this.document,
    required this.personTypes,
    this.employeeData
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'email': email,
      'phone': phone,
      'active': active,
      'document': document,
      'personTypes': personTypes,
      'employeeData': employeeData?.toMap(),
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      active: map['active'] as bool,
      document: map['document'] as String,
      personTypes: List<String>.from(map['personTypes'] as List<String>),
      employeeData: map['employeeData'] != null ? EmployeeData.fromMap(map['employeeData'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source) as Map<String, dynamic>);
}
