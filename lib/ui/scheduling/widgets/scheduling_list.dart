import 'package:flutter/material.dart';
import 'package:sobarba_mobile/domain/entities/scheduling_item.dart';

class SchedulingList extends StatelessWidget {
  final List<SchedulingItem> items;
  final Future<void> Function() onRefresh;

  const SchedulingList({
    super.key,
    required this.items,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: items.isEmpty
          ? ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: const [
                SizedBox(height: 150),
                Center(
                  child: Text(
                    'Nenhum agendamento encontrado',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  elevation: 3,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFF3366FF),
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text(
                      item.client.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Resp: ${item.barber.name}\n'
                      'Início: ${_formatDate(item.scheduling.startDate)} '
                      'Fim: ${_formatDate(item.scheduling.endDate)}',
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')} | ${date.hour}:${date.minute.toString().padLeft(2, '0')}\n';
  }
}