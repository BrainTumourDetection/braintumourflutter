import 'dart:io';
import 'package:braintumour/login.dart';
import 'package:braintumour/register.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class TumorDetectionScreen extends StatefulWidget {
  const TumorDetectionScreen({super.key});

  @override
  State<TumorDetectionScreen> createState() => _TumorDetectionScreenState();
}

class _TumorDetectionScreenState extends State<TumorDetectionScreen> {
  File? _image;
  String _result = '';
  bool _loading = false;

  final ImagePicker _picker = ImagePicker();
   // Pick image from gallery or camera
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _result = '';
      });
      await uploadImage();
    }
  }

  // Upload image to API
  Future<void> uploadImage() async {
    if (_image == null) return;

    setState(() {
      _loading = true;
    });

    try {
      String fileName = _image!.path.split('/').last;

      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(_image!.path, filename: fileName),
      });

      final response = await dio.post('$baseurl/DetectionApi/$loginid', data: formData);

      if (response.statusCode == 200) {
        setState(() {
          _result = response.data.toString(); // show API result
        });
      } else {
        setState(() {
          _result = "Error: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        _result = "Error: $e";
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tumor Detection"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _image == null
                ? const Text("No image")
                : Image.file(
                    _image!,
                    height: 200,
                  ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () => pickImage(ImageSource.camera),
                  icon: const Icon(Icons.camera_alt),
                  label: const Text("Camera"),
                ),
                ElevatedButton.icon(
                  onPressed: () => pickImage(ImageSource.gallery),
                  icon: const Icon(Icons.photo),
                  label: const Text("Gallery"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _loading
                ? const CircularProgressIndicator()
                : Text(
                    _result,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
          ],
        ),
      ),
    );
  }
}
