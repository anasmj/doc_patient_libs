import 'package:example/views/service.actions.dart';
import 'package:flutter/material.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Appointment')),
      body: Center(
        child: ServiceAction(
          onCreate: () {
            // AppointmentService.instance.create(Appointment());
          },
        ),
      ),
    );
  }
}
