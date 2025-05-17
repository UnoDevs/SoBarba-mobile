import 'package:flutter/material.dart';
import 'package:flutter_faculdade_v1/data/dtos/scheduling_dto.dart';
import 'package:flutter_faculdade_v1/data/services/scheduling_service.dart';
import 'package:flutter_faculdade_v1/domain/entities/scheduling.dart';

class SchedulingViewModel extends ChangeNotifier {
  final clientController = TextEditingController();
  final barberController = TextEditingController();
  final serviceController = TextEditingController();
  final totalValueController = TextEditingController();
  final hourValueController = TextEditingController();
  final minuteValueController = TextEditingController();
  final SchedulingService schedulingService = SchedulingService();
  bool init = false;
  List<Scheduling> _schedulings = [];
  String? status = null;

  DateTime serviceDate = DateTime.now();

  void initialize(){
    init = true;
    updateScheduling();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) serviceDate = pickedDate;
    notifyListeners();
    print(serviceDate);
  }

  int actualId = 0;

  List<Scheduling> getScheduling(){
    return _schedulings;
  }


  void updateScheduling() async{
    List<SchedulingDto> list = await  schedulingService.fetchAllSchedulings();
    _schedulings =  list.map((dto) => dto.toEntity()).toList();
    notifyListeners();
  }

  void deleteScheduling(Scheduling sche) {
    schedulingService.fetchDeleteUser(sche.id!);
    updateScheduling();
  }

  void addScheduling(Scheduling sche) async{
    await schedulingService.fetchCreateScheduling(sche);
    updateScheduling();
  }
  
  void toCreateScheduling(BuildContext context) {
    _clearControllers();
    status = null;
    Navigator.pushNamed(context, '/scheduling/create');
    notifyListeners();
  }

  void generateScheduling() {
    if (_emptyValidates()) {

      serviceDate = DateTime(
        serviceDate.year, 
        serviceDate.month,
        serviceDate.day,
        int.parse(hourValueController.text),
        int.parse(minuteValueController.text.isNotEmpty ? minuteValueController.text : '0')
      );
      
      addScheduling(
        Scheduling(
          client: clientController.text,
          barber: barberController.text,
          service: serviceController.text,
          totalValue: double.parse(totalValueController.text),
          date: serviceDate,
        ),
      );
      status = 'Agendamento Cadastrado!';
      _clearControllers();
    }
    
    notifyListeners();
  }

  bool _emptyValidates() {
    if (clientController.text.isEmpty ||
        barberController.text.isEmpty ||
        serviceController.text.isEmpty ||
        totalValueController.text.isEmpty ||
        hourValueController.text.isEmpty) {
      status = 'Preencha todos os campos';
      return false;
    }
    return true;
  }

  bool _dateValidate(){
    if(serviceDate.compareTo(DateTime.now()) > 0){
      return true;
    } 
    status = 'Data deve ser maior que atual';
    return false;
  }

  void _clearControllers(){
    totalValueController.text = '';
    clientController.text = '';
    serviceController.text = '';
    barberController.text = '';
    minuteValueController.text = '';
    hourValueController.text = '';
    serviceDate = DateTime.now();
  }

  @override
  void dispose() {
    clientController.dispose();
    barberController.dispose();
    serviceController.dispose();
    totalValueController.dispose();
    hourValueController.dispose();
    minuteValueController.dispose();
    super.dispose();
  }
}
