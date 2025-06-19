import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:sobarba_mobile/data/repositories/person_repository.dart';
import 'package:sobarba_mobile/data/repositories/scheduling_repository.dart';
import 'package:sobarba_mobile/ui/scheduling/view_models/scheduling_viewmodel.dart';
import 'package:sobarba_mobile/ui/scheduling/widgets/scheduling_drawer.dart';
import 'package:sobarba_mobile/ui/scheduling/widgets/scheduling_list.dart';

class SchedulingHomePage extends StatefulWidget {
  const SchedulingHomePage({super.key});

  @override
  State<SchedulingHomePage> createState() => _SchedulingHomePageState();
}

class _SchedulingHomePageState extends State<SchedulingHomePage> {
  late final SchedulingViewModel _schedulingViewModel;

  @override
  void initState() {
    super.initState();
    _schedulingViewModel = SchedulingViewModel(
      schedulingRepository: SchedulingRepository(),
      personRepository: PersonRepository(),
    );
    _loadData();
  }

  Future<void> _loadData() async {
    await _schedulingViewModel.findAllPeople();
    await _schedulingViewModel.findAllScheduling();
    _schedulingViewModel.generateSchedulingItems();
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color(0xFF0024D4),
      title: const Text(
        'Agendamentos',
        style: TextStyle(color: Colors.white),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    drawer: SchedulingDrawer(onLogout: _handleLogout),
    body: Obx(() {
      if (_schedulingViewModel.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      return SchedulingList(items: _schedulingViewModel.schedulingItems, onRefresh: _loadData);
    }),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Get.toNamed('/create');
      },
      backgroundColor: const Color(0xFF0024D4),
      child: const Icon(Icons.add, color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}

  void _handleLogout() {
    Get.offAllNamed('/login');
  }
}
