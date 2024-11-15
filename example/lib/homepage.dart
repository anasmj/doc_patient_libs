import 'package:example/views/appointment.view.dart';
import 'package:example/views/option.container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example')),
      body: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          const OptionContainer(title: 'Chember'),
          OptionContainer(
            title: 'Appointment',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AppointmentView(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
