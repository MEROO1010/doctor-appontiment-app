import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/appointment_provider.dart';
import 'providers/auth_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/appointments_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppointmentProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (ctx, authProvider, _) {
        return MaterialApp(
          title: 'Doctor Appointment App',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: authProvider.isAuthenticated ? SplashScreen() : LoginScreen(),
        );
      },
    );
  }
}
