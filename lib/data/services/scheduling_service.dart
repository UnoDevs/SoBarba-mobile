import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter_faculdade_v1/data/dtos/scheduling_dto.dart';
import 'package:flutter_faculdade_v1/domain/entities/scheduling.dart';
import 'package:http/http.dart' as http;

class SchedulingService {
  Future<List<SchedulingDto>> fetchAllSchedulings() async {
    final response = await http.get(Uri.parse('http://192.168.200.107:8080/scheduling'));

    if(response.statusCode == 200){
        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => SchedulingDto.fromJson(json)).toList();
    }
    return [];
  }

  Future<SchedulingDto?> fetchCreateScheduling(Scheduling entity) async {
    final formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
    Object body = {
        "client": entity.client,
        "barber": entity.barber,
        "service": entity.service,
        "totalValue": entity.totalValue,
        "date": "${formatter.format(entity.date)}"
      }; 
    final response = await http.post(
      Uri.parse('http://192.168.200.107:8080/scheduling'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    if (response.statusCode == 201) {
      final dynamic json = jsonDecode(response.body);
      return SchedulingDto.fromJson(json);
    }
    return null;
  }

  Future<bool> fetchDeleteUser(int id) async {
    final response = await http.delete(Uri.parse('http://192.168.200.107:8080/scheduling/${id}'));
    if (response.statusCode == 204) {
      return true;
    }
    return false;
  }
}