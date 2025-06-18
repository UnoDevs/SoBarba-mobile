// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EmployeeData {
  final int id;
  final DateTime hireDate;
  final DateTime? terminationDate;
  final double salary;
  final double commission;
  final String jobTitle;

  EmployeeData({
    required this.id,
    required this.hireDate,
    this.terminationDate,
    required this.salary,
    required this.commission,
    required this.jobTitle
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'hireDate': hireDate.millisecondsSinceEpoch,
      'terminationDate': terminationDate?.millisecondsSinceEpoch,
      'salary': salary,
      'comission': commission,
      'jobTitle': jobTitle,
    };
  }

  factory EmployeeData.fromMap(Map<String, dynamic> map) {
    return EmployeeData(
      id: map['id'] as int,
      hireDate: DateTime.parse(map['hireDate']),
      terminationDate: map['terminationDate'] != null ? DateTime.parse(map['terminationDate']) : null,
      salary: map['salary'] as double,
      commission: map['commission'] as double,
      jobTitle: map['jobTitle'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeData.fromJson(String source) => EmployeeData.fromMap(json.decode(source) as Map<String, dynamic>);
}
