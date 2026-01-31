import 'package:braintumour/login.dart';
import 'package:braintumour/prescrip.dart';
import 'package:braintumour/register.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Booked extends StatefulWidget {
  const Booked({super.key});

  @override
  State<Booked> createState() => _BookedState();
}

class _BookedState extends State<Booked> {
  List<Map<String, dynamic>> bookedDoctors = [];



  Future<void> getBookings(BuildContext context) async {
    try {
      final response = await dio.get('$baseurl/bookinghistory/$loginid');
print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() {
          bookedDoctors =
              List<Map<String, dynamic>>.from(response.data ?? []);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to load doctors')),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something went wrong')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getBookings(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookings'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: bookedDoctors.isEmpty
          ? const Center(child: Text('No bookings yet'))
          : ListView.builder(
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
                        const CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.green,
                          child: Icon(
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
                                doctor['doctor_name'] ?? 'Unknown',
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
                                      doctor['specialization'] ?? '',
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
                                      doctor['hospital'] ?? '',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  const Icon(Icons.calendar_today, size: 16),
                                  const SizedBox(width: 6),
                                  Text(
                                      "${doctor['date'] ?? ''} at ${doctor['time'] ?? ''}"),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 8),

                        /// Button (Prescription)
                        SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 140, 198, 239),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Prescrip(aid: doctor['appointment_id'],),));
                            },
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
