import 'package:braintumour/login.dart';
import 'package:braintumour/register.dart';
import 'package:flutter/material.dart';

class Prescrip extends StatefulWidget {
  int aid;
   Prescrip({super.key,required this.aid});

  @override
  State<Prescrip> createState() => _PrescripState();
}

class _PrescripState extends State<Prescrip> {

List<dynamic>prescriptions=[];
 Future<void> get_prescriptions(BuildContext context) async {
    try {
      final response = await dio.get('$baseurl/prescription/${widget.aid}');
print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() {
          prescriptions =
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
    // TODO: implement initState
    super.initState();
    get_prescriptions(context);
    print(widget.aid);
  }

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
