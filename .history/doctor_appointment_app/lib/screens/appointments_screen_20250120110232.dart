import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/appointment_provider.dart';
import '../styles/styles.dart';

class AppointmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Appointments')),
      body: FutureBuilder(
        future:
            Provider.of<AppointmentProvider>(
              context,
              listen: false,
            ).fetchAppointments(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Consumer<AppointmentProvider>(
              builder: (ctx, appointmentProvider, _) {
                return ListView.builder(
                  itemCount: appointmentProvider.appointments.length,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      title: Text(
                        appointmentProvider
                            .appointments[index]['doctor']['name'],
                        style: kTitleStyle,
                      ),
                      subtitle: Text(
                        appointmentProvider
                            .appointments[index]['appointment_date'],
                        style: kSubtitleStyle,
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
