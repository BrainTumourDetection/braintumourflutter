import 'package:braintumour/login.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatefulWidget {
  Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

TextEditingController name = TextEditingController();
TextEditingController age = TextEditingController();
TextEditingController Address = TextEditingController();
TextEditingController Phone = TextEditingController();
TextEditingController Email = TextEditingController();
TextEditingController password = TextEditingController();
final formkey=GlobalKey<FormState>();

class _RegisterpageState extends State<Registerpage> {
  String selectedgender = 'male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(key: formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter your name';
                    }
                  },
                  decoration: InputDecoration(
                    label: Text('Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: age,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter your age';
                    }
                  },
                  decoration: InputDecoration(
                    label: Text('Age'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Radio(
                    value: 'male',
                    groupValue: selectedgender,
                    onChanged: (value) {
                      setState(() {
                        selectedgender = value!;
                      });
                    },
                  ),
                  Text('male'),
                  Radio(
                    value: 'female',
                    groupValue: selectedgender,
                    onChanged: (value) {
                      setState(() {
                        selectedgender = value!;
                      });
                    },
                  ),
                  Text('female'),
                  Radio(
                    value: 'others',
                    groupValue: selectedgender,
                    onChanged: (value) {
                      setState(() {
                        selectedgender = value!;
                      });
                    },
                  ),
                  Text('others'),
                ],
              ),
          
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: Address,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter your address';
                    }
                  },
                  maxLines: 8,
                  decoration: InputDecoration(
                    label: Text('Address'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: Phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter your phone';
                    }
                  },
                  decoration: InputDecoration(
                    label: Text('Phone'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: Email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter your email';
                    }
                  },
                  decoration: InputDecoration(
                    label: Text('Email'),
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
                    if (value == null || value.isEmpty) {
                      return 'enter your password';
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
                    MaterialPageRoute(builder: (context) => Loginpage()),
                  );
                 }
                },
                child: Text('Register', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  foregroundColor: Colors.black,
                  minimumSize: Size(50, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
