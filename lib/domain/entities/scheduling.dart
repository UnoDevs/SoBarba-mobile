class Scheduling {
  int? id;
  final String client;
  final String barber;
  final String service;
  final double totalValue;
  final DateTime date;

  Scheduling({
    this.id,
    required this.client,
    required this.barber,
    required this.service,
    required this.totalValue,
    required this.date,
  });
}
