import 'package:flutter_faculdade_v1/domain/entities/scheduling.dart';

class SchedulingDto {
  final int id;
  final String client;
  final String barber;
  final String service;
  final double totalValue;
  final DateTime date;

  SchedulingDto({
    required this.id,
    required this.client,
    required this.barber,
    required this.service,
    required this.totalValue,
    required this.date,
  });

  factory SchedulingDto.fromJson(Map<String, dynamic> json) {
    return SchedulingDto(
      id: json['id'],
      client: json['client'],
      barber: json['barber'],
      service: json['service'],
      totalValue: (json['totalValue'] as num).toDouble(),
      date: DateTime.parse(json['date']),
    );
  }

  Scheduling toEntity() {
    return Scheduling(id: this.id, client: this.client, barber: this.barber, service: this.service, totalValue: this.totalValue, date: this.date);
  }
}
