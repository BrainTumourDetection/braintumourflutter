import 'package:flutter/material.dart';

class Appoinment extends StatefulWidget {
  const Appoinment({super.key});

  @override
  State<Appoinment> createState() => _AppoinmentState();
}

class _AppoinmentState extends State<Appoinment> {
  final List<Map<String, dynamic>> doctors = [
    {
      'name': 'Dr. Sreeshma',
      'specialization': 'Orthology',
      'phone': '9583475025',
      'hospital': 'Fathima Hospital',
    },
    {
      'name': 'Dr. Anjal',
      'specialization': 'Neurology',
      'phone': '9897865421',
      'hospital': 'Medical College',
    },
    {
      'name': 'Dr. Sneha',
      'specialization': 'Neurology',
      'phone': '9826713726',
      'hospital': 'Red Crescent Hospital',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Appointments'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];

          return Card(
            elevation: 6,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  /// Doctor Avatar
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.deepPurple,
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 12),

                  /// Doctor Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor['name'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),

                        Row(
                          children: [
                            const Icon(Icons.medical_services, size: 16),
                            const SizedBox(width: 5),
                            Text(doctor['specialization']),
                          ],
                        ),

                        Row(
                          children: [
                            const Icon(Icons.local_hospital, size: 16),
                            const SizedBox(width: 5),
                            Text(doctor['hospital']),
                          ],
                        ),

                        Row(
                          children: [
                            const Icon(Icons.phone, size: 16),
                            const SizedBox(width: 5),
                            Text(doctor['phone']),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// Booking Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // booking logic here
                    },
                    child: const Text('Book'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
