import 'package:flutter/material.dart';

class Booked extends StatefulWidget {
  const Booked({super.key});

  @override
  State<Booked> createState() => _BookedState();
}

class _BookedState extends State<Booked> {
  final List<Map<String, dynamic>> bookedDoctors = [
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
        title: const Text('My Bookings'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: bookedDoctors.length,
        itemBuilder: (context, index) {
          final doctor = bookedDoctors[index];

          return Card(
            elevation: 6,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    CircleAvatar(
      radius: 28,
      backgroundColor: Colors.green,
      child: const Icon(
        Icons.person,
        color: Colors.white,
        size: 28,
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
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),

          Row(
            children: [
              const Icon(Icons.medical_services, size: 16),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  doctor['specialization'],
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          Row(
            children: [
              const Icon(Icons.local_hospital, size: 16),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  doctor['hospital'],
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          Row(
            children: [
              const Icon(Icons.phone, size: 16),
              const SizedBox(width: 6),
              Text(doctor['phone']),
            ],
          ),
        ],
      ),
    ),

    const SizedBox(width: 8),

    /// Button (Constrained)
    SizedBox(
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 140, 198, 239),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        child: const Text(
          'Prescription',
          overflow: TextOverflow.ellipsis,
        ),
      ),
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
