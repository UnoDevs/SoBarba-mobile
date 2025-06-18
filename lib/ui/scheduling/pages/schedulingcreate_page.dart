import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sobarba_mobile/domain/entities/scheduling.dart';
import 'package:sobarba_mobile/ui/scheduling/view_models/schedulingviewmodel.dart';

class SchedulingCreatePage extends StatefulWidget {
  const SchedulingCreatePage({super.key});

  @override
  State<SchedulingCreatePage> createState() => _SchedulingcreatePageState();
}

class _SchedulingcreatePageState extends State<SchedulingCreatePage> {
  late final SchedulingViewModel _schedulingViewModel = Get.find();
  final RxnInt selectedClientId = RxnInt();
  final RxnInt selectedBarberId = RxnInt();
  DateTime? startDate;
  DateTime? endDate;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo Agendamento')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          if (_schedulingViewModel.people.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          final clients = _schedulingViewModel.people.where((p) => !p.personTypes.contains("EMPLOYEE")).toList();
          final barbers = _schedulingViewModel.people.where((p) => p.personTypes.contains("EMPLOYEE")).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<int>(
                decoration: const InputDecoration(labelText: 'Cliente'),
                value: selectedClientId.value,
                items: clients.map((p) {
                  return DropdownMenuItem(value: p.id, child: Text(p.name));
                }).toList(),
                onChanged: (value) => selectedClientId.value = value,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<int>(
                decoration: const InputDecoration(labelText: 'Barbeiro'),
                value: selectedBarberId.value,
                items: barbers.map((p) {
                  return DropdownMenuItem(value: p.id, child: Text(p.name));
                }).toList(),
                onChanged: (value) => selectedBarberId.value = value,
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                icon: const Icon(Icons.calendar_today),
                label: Text(startDate == null ? 'Selecionar Início' : 'Início: ${_formatDate(startDate!)}'),
                onPressed: () async {
                  final picked = await _pickDateTime();
                  if (picked != null) setState(() => startDate = picked);
                },
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                icon: const Icon(Icons.calendar_month),
                label: Text(endDate == null ? 'Selecionar Fim' : 'Fim: ${_formatDate(endDate!)}'),
                onPressed: () async {
                  final picked = await _pickDateTime();
                  if (picked != null) setState(() => endDate = picked);
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Salvar Agendamento'),
              ),
            ],
          );
        }),
      ),
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
      Get.snackbar('Campos obrigatórios', 'Preencha todos os campos corretamente.',
        backgroundColor: Colors.orange, colorText: Colors.white);
      return;
    }

    _schedulingViewModel.createScheduling(
      Scheduling(
        id: 0, // será ignorado no back-end
        clientId: selectedClientId.value!,
        barberId: selectedBarberId.value!,
        startDate: startDate!,
        endDate: endDate!,
      )
    );
    Get.back();
  }
}