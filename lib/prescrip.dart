import 'package:flutter/material.dart';

class Prescrip extends StatefulWidget {
  const Prescrip({super.key});

  @override
  State<Prescrip> createState() => _PrescripState();
}

class _PrescripState extends State<Prescrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('prescription'), backgroundColor: Colors.blue),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.person_2),
              title: Text('prescription'),
              subtitle: Column(children: [Text('paracetamol 500mg'),]),
            ),
          );
        },
      ),
    );
  }
}
