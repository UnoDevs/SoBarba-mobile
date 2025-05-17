import 'package:flutter/material.dart';
import 'package:flutter_faculdade_v1/domain/entities/scheduling.dart';

class SchedulingCardWidget extends StatelessWidget {
  final Scheduling scheduling;
  final void Function() onDelete;

  const SchedulingCardWidget({super.key, required this.scheduling, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 2),
        title: Row(
          children: [
            Expanded(child: Text(scheduling.client)),
            IconButton(
              onPressed: onDelete, 
              icon: Icon(Icons.delete))
          ],
        ),
        subtitle: DataTable(
          columns: const <DataColumn> [
            DataColumn(label: Expanded(child: Text('Servico',style: TextStyle(fontStyle: FontStyle.italic),))),
            DataColumn(label: Expanded(child: Text('Valor',style: TextStyle(fontStyle: FontStyle.italic),))),
            DataColumn(label: Expanded(child: Text('Data',style: TextStyle(fontStyle: FontStyle.italic),))),
          ], 
          rows: <DataRow> [
            DataRow(cells: <DataCell>[
              DataCell(Text(scheduling.service)),
              DataCell(Text(scheduling.totalValue.toString())),
              DataCell(Text('${scheduling.date.day}/${scheduling.date.month}/${scheduling.date.year} ${scheduling.date.hour}:${scheduling.date.minute}')),
            ])
          ]),
      ),
    );
  }
}