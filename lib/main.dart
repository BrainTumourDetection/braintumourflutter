import 'package:braintumour/appoinment.dart';
import 'package:braintumour/booked.dart';
import 'package:braintumour/login.dart';
import 'package:braintumour/notification.dart';
import 'package:braintumour/post.dart';
import 'package:braintumour/prescrip.dart';
import 'package:braintumour/register.dart';
import 'package:braintumour/review.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Loginpage(),
    );
  }
}
