import 'package:flutter/material.dart';

class CardTableWidget extends StatelessWidget {
  const CardTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 1,left: 1,bottom: 5),
                  child: Text(
                    "Nome do Cliente",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 42),
                      fontSize: 20,
                    ),
                  )
                )
              ),
              DataTable(
                dataTextStyle: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 42),
                  fontSize: 12
                ),
                
                columnSpacing: 20,
                headingTextStyle: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 42),
                  fontSize: 15,
                ),
                headingRowHeight: 30,
                columns: [
                DataColumn(label: Expanded(child: Text("Serviço"))),
                DataColumn(label: Expanded(child: Text("Data"))),
                DataColumn(label: Expanded(child: Text("Horario"))),
                DataColumn(label: Expanded(child: Text(""))),
              ],
              rows: [
                DataRow(
                  cells:[ 
                    DataCell(Text("Corte de Cabelo")),
                    DataCell(Text("13/04/25")),
                    DataCell(Text("21:51")),
                    DataCell(Icon(size: 20, color:  Color.fromARGB(255, 0, 0, 42),Icons.delete)),
                  ]
                ),
              ]
            ),
          ],
        )
      )
    );
  }
}