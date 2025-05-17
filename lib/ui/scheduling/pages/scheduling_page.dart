import 'package:flutter/material.dart';
import 'package:flutter_faculdade_v1/ui/login/view_models/login_viewmodel.dart';
import 'package:flutter_faculdade_v1/ui/scheduling/view_models/scheduling_viewmodel.dart';
import 'package:flutter_faculdade_v1/ui/scheduling/widgets/schedulingappbard_widget.dart';
import 'package:flutter_faculdade_v1/ui/scheduling/widgets/schedulingcard_widget.dart';
import 'package:flutter_faculdade_v1/ui/scheduling/widgets/schedulingcontainer_widget.dart';
import 'package:provider/provider.dart';

class SchedulingView extends StatelessWidget {
  const SchedulingView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SchedulingViewModel>(context);
    final viewModelLogin = Provider.of<LoginViewmodel>(context);

    if(viewModel.init == false) viewModel.initialize();

    List<SchedulingCardWidget> cards = [];

    if(!(viewModel.getScheduling()).isEmpty){
      cards = viewModel.getScheduling()
      .map((sheduling) => SchedulingCardWidget(scheduling: sheduling,onDelete: () {viewModel.deleteScheduling(sheduling);},),).toList();
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SchedulingAppBar(callback: (){viewModel.toCreateScheduling(context);}, userName: viewModelLogin.connectedUser?.name ?? 'Usuário'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SchedulingContainerWidget(
                title: 'Próximo Serviço',
                schedulings:
                  cards.length > 0 ? cards.sublist(0,1) : []
              ),
              SchedulingContainerWidget(
                title: 'Agendamentos',
                schedulings:
                    cards
              ),
            ],
          ),
        ),
      ),
    );
  }
}
