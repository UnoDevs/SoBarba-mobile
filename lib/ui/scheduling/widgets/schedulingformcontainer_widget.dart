import 'package:flutter/material.dart';
import 'package:flutter_faculdade_v1/ui/scheduling/view_models/scheduling_viewmodel.dart';
import 'package:flutter_faculdade_v1/ui/scheduling/widgets/schedulingform_widget.dart';
import 'package:provider/provider.dart';

class SchedulingFormContainer extends StatelessWidget {
  const SchedulingFormContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SchedulingViewModel>(context);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(24),
          padding: EdgeInsets.only(top: 16, bottom: 16, left: 4, right: 4),
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(220, 2, 2, 78),
                Color.fromARGB(221, 13, 13, 236),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SchedulingTextForm(
                controller: viewModel.clientController,
                label: 'Cliente',
              ),
              SchedulingTextForm(
                controller: viewModel.barberController,
                label: 'Barbeiro',
              ),
              Row(
                children: [
                  Expanded(
                    child: SchedulingTextForm(
                      controller: viewModel.serviceController,
                      label: 'Servico',
                    ),
                  ),
                  Expanded(
                    child: SchedulingValueForm(
                      controller: viewModel.totalValueController,
                      label: 'Valor Total',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SchedulingDateForm(
                    label:
                        '${viewModel.serviceDate.day}/${viewModel.serviceDate.month}/${viewModel.serviceDate.year}',
                    callback: () {
                      viewModel.selectDate(context);
                    },
                  ),
                  Expanded(
                    child: SchedulingHourForm(
                      controller: viewModel.hourValueController,
                      label: '00-23',
                    ),
                  ),
                  Expanded(
                    child: SchedulingMinuteForm(
                      controller: viewModel.minuteValueController,
                      label: '00-59',
                    ),
                  ),
                ],
              ),
              viewModel.status == null
                  ? Text('')
                  : Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      viewModel.status ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            viewModel.generateScheduling();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(221, 13, 13, 236),
            padding: EdgeInsets.symmetric(horizontal: 80,vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.all(Radius.circular(22)),
              side: BorderSide(
                color: const Color.fromARGB(255, 37, 37, 37)
              )
            )
          ),
          child: Text(
            'Salvar',
            style: TextStyle(
              color: Color.fromARGB(221, 255, 255, 255),
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
            ),
        ),
      ],
    );
  }
}
