// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Scheduling {
  final int id;
  final int clientId;
  final int barberId;
  final DateTime startDate;
  final DateTime endDate;

  Scheduling({
    required this.id,
    required this.clientId,
    required this.barberId,
    required this.startDate,
    required this.endDate
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'clientId': clientId,
      'barberId': barberId,
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate.millisecondsSinceEpoch,
    };
  }

  factory Scheduling.fromMap(Map<String, dynamic> map) {
    return Scheduling(
      id: map['id'] as int,
      clientId: map['clientId'] as int,
      barberId: map['barberId'] as int,
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Scheduling.fromJson(String source) => Scheduling.fromMap(json.decode(source) as Map<String, dynamic>);
}
