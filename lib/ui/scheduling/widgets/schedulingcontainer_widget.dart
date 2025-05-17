import 'package:flutter/material.dart';
import 'package:flutter_faculdade_v1/ui/scheduling/widgets/schedulingcard_widget.dart';

class SchedulingContainerWidget extends StatelessWidget {
  final String title;
  final List<SchedulingCardWidget> schedulings;

  const SchedulingContainerWidget({
    super.key,
    required this.title,
    required this.schedulings,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 45, 61, 204),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 1,
            blurRadius: 12,
            offset: Offset(1, 3)
          )
        ]
      ),
      padding: const EdgeInsets.all(16),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.title,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          ...schedulings.isEmpty ? [
            Text(
              'Sem Agendamentos!!',
              style: TextStyle(
                color: Colors.white),
              textAlign: TextAlign.center,
              ),
              
          ] : schedulings,
        ],
      ),
    );
  }
}
