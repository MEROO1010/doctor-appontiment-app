import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/appointment_provider.dart';

class BookAppointmentScreen extends StatefulWidget {
  @override
  _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  final TextEditingController _doctorIdController = TextEditingController();
  final TextEditingController _patientIdController = TextEditingController();
  final TextEditingController _appointmentDateController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Appointment')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _doctorIdController,
              decoration: InputDecoration(labelText: 'Doctor ID'),
            ),
            TextField(
              controller: _patientIdController,
              decoration: InputDecoration(labelText: 'Patient ID'),
            ),
            TextField(
              controller: _appointmentDateController,
              decoration: InputDecoration(labelText: 'Appointment Date'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final doctorId = int.parse(_doctorIdController.text);
                final patientId = int.parse(_patientIdController.text);
                final appointmentDate = _appointmentDateController.text;
                Provider.of<AppointmentProvider>(
                  context,
                  listen: false,
                ).bookAppointment(
                  doctorId,
                  patientId,
                  appointmentDate,
                  context,
                );
              },
              child: Text('Book Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
