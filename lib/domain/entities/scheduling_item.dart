// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:sobarba_mobile/domain/entities/person.dart';
import 'package:sobarba_mobile/domain/entities/scheduling.dart';

class SchedulingItem {
  final Scheduling scheduling;
  final Person client;
  final Person barber;

  SchedulingItem({
    required this.scheduling,
    required this.client,
    required this.barber
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'scheduling': scheduling.toMap(),
      'client': client.toMap(),
      'barber': barber.toMap(),
    };
  }

  factory SchedulingItem.fromMap(Map<String, dynamic> map) {
    return SchedulingItem(
      scheduling: Scheduling.fromMap(map['scheduling'] as Map<String,dynamic>),
      client: Person.fromMap(map['client'] as Map<String,dynamic>),
      barber: Person.fromMap(map['barber'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory SchedulingItem.fromJson(String source) => SchedulingItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
