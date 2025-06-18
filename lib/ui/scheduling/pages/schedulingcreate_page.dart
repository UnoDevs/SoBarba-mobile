import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sobarba_mobile/data/repositories/person_repository.dart';
import 'package:sobarba_mobile/data/repositories/scheduling_repository.dart';
import 'package:sobarba_mobile/domain/entities/scheduling.dart';
import 'package:sobarba_mobile/ui/scheduling/view_models/schedulingviewmodel.dart';

class SchedulingCreatePage extends StatefulWidget {
  const SchedulingCreatePage({super.key});

  @override
  State<SchedulingCreatePage> createState() => _SchedulingcreatePageState();
}

class _SchedulingcreatePageState extends State<SchedulingCreatePage> {
  late final SchedulingViewModel _schedulingViewModel;
  final RxnInt selectedClientId = RxnInt();
  final RxnInt selectedBarberId = RxnInt();
  DateTime? startDate;
  DateTime? endDate;

  final Color primaryBlue = const Color(0xFF0024D4);
  final Color lightBlue = const Color(0xFFE5E9FF);

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
        backgroundColor: primaryBlue,
        title: const Text(
          'Novo Agendamento',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFE5E9FF),
      body: RefreshIndicator(
        onRefresh: () => _loadData(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Obx(() {
            if (_schedulingViewModel.people.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            final clients =
                _schedulingViewModel.people
                    .where((p) => !p.personTypes.contains("EMPLOYEE"))
                    .toList();

            final barbers =
                _schedulingViewModel.people
                    .where((p) => p.personTypes.contains("EMPLOYEE"))
                    .toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildDropdown(
                  label: 'Cliente',
                  value: selectedClientId.value,
                  people: clients,
                  onChanged: (value) => selectedClientId.value = value,
                ),
                const SizedBox(height: 12),
                _buildDropdown(
                  label: 'Barbeiro',
                  value: selectedBarberId.value,
                  people: barbers,
                  onChanged: (value) => selectedBarberId.value = value,
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.calendar_today, color: Colors.white),
                  label: Text(
                    startDate == null
                        ? 'Selecionar Início'
                        : 'Início: ${_formatDate(startDate!)}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    final picked = await _pickDateTime();
                    if (picked != null) setState(() => startDate = picked);
                  },
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.calendar_month, color: Colors.white),
                  label: Text(
                    endDate == null
                        ? 'Selecionar Fim'
                        : 'Fim: ${_formatDate(endDate!)}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    final picked = await _pickDateTime();
                    if (picked != null) setState(() => endDate = picked);
                  },
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _submit,
                  child: const Text(
                    'Salvar Agendamento',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required int? value,
    required List people,
    required void Function(int?) onChanged,
  }) {
    return DropdownButtonFormField<int>(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryBlue),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryBlue, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        labelStyle: TextStyle(color: Colors.black),
      ),
      value: value,
      items:
          people.map<DropdownMenuItem<int>>((p) {
            return DropdownMenuItem<int>(value: p.id, child: Text(p.name));
          }).toList(),
      onChanged: onChanged,
    );
  }

  Future<DateTime?> _pickDateTime() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDate: DateTime.now(),
    );
    if (date == null) return null;

    final time = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 9, minute: 0),
    );
    if (time == null) return null;

    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }

  void _submit() {
    if (selectedClientId.value == null ||
        selectedBarberId.value == null ||
        startDate == null ||
        endDate == null) {
      Get.snackbar(
        'Campos obrigatórios',
        'Preencha todos os campos corretamente.',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    _schedulingViewModel.createScheduling(
      Scheduling(
        id: 0,
        clientId: selectedClientId.value!,
        barberId: selectedBarberId.value!,
        startDate: startDate!,
        endDate: endDate!,
      ),
    );
    Get.back(result: true);
  }
}
