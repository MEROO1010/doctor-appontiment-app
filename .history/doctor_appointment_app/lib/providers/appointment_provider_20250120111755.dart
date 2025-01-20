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

  Future<void> bookAppointment(
    int doctorId,
    int patientId,
    String appointmentDate,
    dynamic _token,
  ) async {
    final response = await http.post(
      Uri.parse('http://yourapiurl.com/api/appointments'),
      headers: {'Authorization': 'Bearer $_token'},
      body: {
        'doctor_id': doctorId.toString(),
        'patient_id': patientId.toString(),
        'appointment_date': appointmentDate,
      },
    );

    if (response.statusCode == 201) {
      fetchAppointments();
    }
  }
}
