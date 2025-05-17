import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SchedulingTextForm extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const SchedulingTextForm({super.key, required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(6, 2, 6, 4),
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))
          )
        ),
      ),
    );
  }
}

class SchedulingValueForm extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const SchedulingValueForm({super.key, required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(6, 2, 6, 4),
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          TextInputFormatter.withFunction((oldValue, newValue){
            final text = newValue.text;
            if(RegExp(r'^(?:\d+(?:\.\d{0,2})?)?$').hasMatch(text)){
              return newValue;
            }
            return oldValue;
          })
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))
          )
        ),
      ),
    );
  }
}

class SchedulingHourForm extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const SchedulingHourForm({super.key, required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(6, 2, 6, 4),
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          TextInputFormatter.withFunction((oldValue, newValue){
            final text = newValue.text;
            if(RegExp(r'^\d*$').hasMatch(text)){
              int hour = int.parse(text);
              if(hour >= 0 && hour <= 23){
                return newValue;
              }
            }
            return oldValue;
          })
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))
          )
        ),
      ),
    );
  }
}

class SchedulingMinuteForm extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const SchedulingMinuteForm({super.key, required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(6, 2, 6, 4),
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          TextInputFormatter.withFunction((oldValue, newValue){
            final text = newValue.text;
            if(RegExp(r'^\d*$').hasMatch(text)){
              int minute = int.parse(text);
              if(minute >= 0 && minute <= 59){
                return newValue;
              }
            }
            return oldValue;
          })
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))
          )
        ),
      ),
    );
  }
}

class SchedulingDateForm extends StatelessWidget {
  final void Function() callback;
  final String label;
  const SchedulingDateForm({super.key, required this.label, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(6, 2, 6, 4),
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: ElevatedButton(
        onPressed: callback, 
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))
          )
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.normal
          ),
        ),

        )
    );
  }
}