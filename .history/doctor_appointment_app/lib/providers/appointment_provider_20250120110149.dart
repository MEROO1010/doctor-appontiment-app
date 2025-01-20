import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppointmentProvider with ChangeNotifier {
  List _appointments = [];

  List get appointments => _appointments;

  Future<void> fetchAppointments() async {
    final response = await http.get(
      Uri.parse('http://yourapiurl.com/api/appointments'),
    );
    _appointments = json.decode(response.body);
    notifyListeners();
  }
}
