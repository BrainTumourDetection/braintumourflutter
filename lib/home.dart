import 'package:braintumour/appoinment.dart';
import 'package:braintumour/booked.dart';
import 'package:braintumour/detection.dart';
import 'package:braintumour/notification.dart';
import 'package:braintumour/prescrip.dart';
import 'package:braintumour/review.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Patient Home"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: const [
                    Icon(Icons.person, size: 50, color: Colors.blue),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome 👋",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text("Have a healthy day!")
                      ],
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _buildMenuItem(
                    Icons.assignment,
                    "Appointment",
                    context,
                    const Appoinment(),
                  ),
                  // _buildMenuItem(
                  //   Icons.local_hospital,
                  //   "Notifications",
                  //   context,
                  //   // const Prescrip(),
                  // ),
                  _buildMenuItem(
                    Icons.local_hospital,
                    "Prescription",
                    context,
                    const NotificationScreen(),
                  ),
                  _buildMenuItem(
                    Icons.calendar_today,
                    "Review",
                    context,
                    const Review(),
                  ),
                  _buildMenuItem(
                    Icons.medical_services,
                    "Booked",
                    context,
                    const Booked(),
                  ), _buildMenuItem(
                    Icons.details,
                    "Detection",
                    context,
                    const TumorDetectionScreen(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String title,
    BuildContext context,
    Widget page,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
