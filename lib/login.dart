import 'package:braintumour/register.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
   Loginpage({super.key});
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();
  final formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('loginpage'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Form(key: formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: username,
                validator: (value) {
                  if (value==null || value.isEmpty){
                    return 'username required';
                  }
                },
                decoration: InputDecoration(
                  label: Text('username'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: password,
                validator: (value) {
                  if (value==null || value.isEmpty){
                    return 'password required';
                  }
                },
                decoration: InputDecoration(
                  label: Text('password'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if(formkey.currentState!.validate()){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Registerpage()),
                  );
                }
              },
              child: Text('login', style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: Size(50, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
