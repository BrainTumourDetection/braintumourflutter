import 'package:braintumour/login.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'register.dart'; // contains dio & baseurl

class Appoinment extends StatefulWidget {
  const Appoinment({super.key});

  @override
  State<Appoinment> createState() => _AppoinmentState();
}

class _AppoinmentState extends State<Appoinment> {
  List<Map<String, dynamic>> doctors = [];

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  // ---------------- GET DOCTORS ----------------
  Future<void> get_doctors(BuildContext context) async {
    try {
      final response = await dio.get('$baseurl/doctorapi');

      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() {
          doctors = List<Map<String, dynamic>>.from(response.data);
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

  // ---------------- DATE & TIME PICKER ----------------
  Future<void> selectDateTime(BuildContext context, int doctorId) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date == null) return;

    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time == null) return;

    final String formattedDate =
        "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

    final String formattedTime =
        "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";

    bookingapi(
      context,
      doctorId: doctorId,
      date: formattedDate,
      time: formattedTime,
    );
  }

  // ---------------- BOOKING API ----------------
  Future<void> bookingapi(
    BuildContext context, {
    required int doctorId,
    required String date,
    required String time,
  }) async {
    try {
      final response = await dio.post(
        '$baseurl/bookingapi/$loginid',
        data: {
          "doctor_id": doctorId,
          "date": date,
          "time": time,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Booking successful')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Booking failed')),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something went wrong')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    get_doctors(context);
  }

  // ---------------- UI ----------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Appointments'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: doctors.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
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
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.deepPurple,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctor['Name'] ?? '',
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
                                  Text(doctor['Specialization'] ?? ''),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.local_hospital, size: 16),
                                  const SizedBox(width: 5),
                                  Text(doctor['HospitalName'] ?? ''),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.phone, size: 16),
                                  const SizedBox(width: 5),
                                  Text(
                                    doctor['PhNumber'] != null
                                        ? doctor['PhNumber'].toString()
                                        : '',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            selectDateTime(context, doctor['id']);
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
