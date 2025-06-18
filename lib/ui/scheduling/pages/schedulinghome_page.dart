import 'package:flutter/material.dart';
import 'package:sobarba_mobile/data/repositories/person_repository.dart';
import 'package:sobarba_mobile/data/repositories/scheduling_repository.dart';
import 'package:sobarba_mobile/ui/scheduling/view_models/schedulingviewmodel.dart';

class SchedulingHomePage extends StatefulWidget {
  const SchedulingHomePage({super.key});

  @override
  State<SchedulingHomePage> createState() => _SchedulingHomePageState();
}

class _SchedulingHomePageState extends State<SchedulingHomePage> {
  late final SchedulingViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = SchedulingViewModel(
      schedulingRepository: SchedulingRepository(),
      personRepository: PersonRepository(),
    );
    _loadData();
  }

  Future<void> _loadData() async {
    await _viewModel.findAllPeople();
    await _viewModel.findAllScheduling();
    _viewModel.generateSchedulingItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendamentos'),
      ),
      drawer: null,
    );
  }
}
