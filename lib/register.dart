import 'package:braintumour/login.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final formkey = GlobalKey<FormState>();
  String selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.amberAccent, Colors.deepPurpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 25),

                        _buildTextField(
                          controller: name,
                          label: 'Name',
                          icon: Icons.person,
                        ),

                        _buildTextField(
                          controller: age,
                          label: 'Age',
                          icon: Icons.cake,
                          keyboardType: TextInputType.number,
                        ),

                        /// Gender
                        const SizedBox(height: 10),
                      Padding(
  padding: const EdgeInsets.symmetric(vertical: 10),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Gender',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 5),

      RadioListTile<String>(
        title: const Text('Male'),
        value: 'Male',
        groupValue: selectedGender,
        onChanged: (value) {
          setState(() {
            selectedGender = value!;
          });
        },
      ),

      RadioListTile<String>(
        title: const Text('Female'),
        value: 'Female',
        groupValue: selectedGender,
        onChanged: (value) {
          setState(() {
            selectedGender = value!;
          });
        },
      ),

      RadioListTile<String>(
        title: const Text('Other'),
        value: 'Other',
        groupValue: selectedGender,
        onChanged: (value) {
          setState(() {
            selectedGender = value!;
          });
        },
      ),
    ],
  ),
),

                        _buildTextField(
                          controller: address,
                          label: 'Address',
                          icon: Icons.location_on,
                          maxLines: 3,
                        ),

                        _buildTextField(
                          controller: phone,
                          label: 'Phone',
                          icon: Icons.phone,
                          keyboardType: TextInputType.phone,
                        ),

                        _buildTextField(
                          controller: email,
                          label: 'Email',
                          icon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                        ),

                        _buildTextField(
                          controller: password,
                          label: 'Password',
                          icon: Icons.lock,
                          obscureText: true,
                        ),

                        const SizedBox(height: 25),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Loginpage(),
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              'REGISTER',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loginpage(),
                              ),
                            );
                          },
                          child: const Text('Already have an account? Login'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Reusable TextField Widget
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: maxLines,
        validator: (value) =>
            value == null || value.isEmpty ? 'Required field' : null,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}