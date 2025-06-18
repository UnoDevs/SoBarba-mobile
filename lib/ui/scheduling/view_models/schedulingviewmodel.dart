import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sobarba_mobile/data/repositories/person_repository.dart';
import 'package:sobarba_mobile/data/repositories/scheduling_repository.dart';
import 'package:sobarba_mobile/domain/entities/person.dart';
import 'package:sobarba_mobile/domain/entities/scheduling.dart';
import 'package:sobarba_mobile/domain/entities/scheduling_item.dart';

class SchedulingViewModel extends GetxController {
  final SchedulingRepository schedulingRepository;
  final PersonRepository personRepository;
  final RxList<Person> _people = <Person>[].obs;
  final RxList<Scheduling> _schedulings = <Scheduling>[].obs;
  final RxList<SchedulingItem> _schedulingItems = <SchedulingItem>[].obs;
  get people => _people;
  get schedulings => _schedulings;
  get schedulingItems => _schedulingItems;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  SchedulingViewModel({
    required this.schedulingRepository,
    required this.personRepository,
  });

  Future<void> findAllPeople() async {
    try {
      _isLoading.value = true;
      final response = await personRepository.findAll();
      _people.assignAll(response);
      _isLoading.value = false;
    } catch (e) {
      Get.snackbar(
        'Erro ao puxar pessoas!',
        'Verifique sua conexão $e',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(12),
      );
      print(e);
    }
  }

  Future<void> findAllScheduling() async {
    try {
      _isLoading.value = true;
      final response = await schedulingRepository.findAll();
      _schedulings.assignAll(response);
      _isLoading.value = false;
    } catch (e) {
      Get.snackbar(
        'Erro ao puxar agendamentos!',
        'Verifique sua conexão',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(12),
      );
      print(e);
    }
  }

  Future<void> createScheduling() async {}

  List<SchedulingItem> generateSchedulingItems() {
    final List<SchedulingItem> items = [];

    for (final scheduling in _schedulings) {
      try {
        final client = _people.firstWhere((p) => p.id == scheduling.clientId);
        final barber = _people.firstWhere((p) => p.id == scheduling.barberId);

        final item = SchedulingItem(
          scheduling: scheduling,
          client: client,
          barber: barber,
        );

        items.add(item);
      } catch (e) {
        debugPrint(
          'Erro ao montar SchedulingItem para ID ${scheduling.id}: $e',
        );
      }
    }

    _schedulingItems.assignAll(items);
    return items;
  }
}
