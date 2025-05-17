import 'package:flutter/material.dart';
import 'package:flutter_faculdade_v1/ui/scheduling/widgets/schedulingformcontainer_widget.dart';

class SchedulingCreateView extends StatelessWidget {

  const SchedulingCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Agendamento",
        style: TextStyle(
          fontSize: 22,
          color: Colors.black
        ),),
      ),
      body: SchedulingFormContainer(),
    );
  }
}