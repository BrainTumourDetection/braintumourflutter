import 'package:flutter/material.dart';

class ViewPost extends StatefulWidget {
  const ViewPost({super.key});

  @override
  State<ViewPost> createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  final String imageUrl =
      'https://tse3.mm.bing.net/th/id/OIP.fxmPWbURYvhYPuqPKFMRegHaDt?rs=1&pid=ImgDetMain&o=7&rm=3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Post'),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Post Card
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Doctor Info Row
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.brown.shade200,
                          child: const Icon(
                            Icons.person,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Dr. John Smith',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Cardiologist',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    /// Post Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        imageUrl,
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// Post Description
                    const Text(
                      'Maintaining a healthy lifestyle is very important. '
                      'Drink enough water daily, eat nutritious food, and exercise regularly. '
                      'If you feel unwell, please consult a doctor immediately.',
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// Action Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.thumb_up, color: Colors.brown),
                          label: const Text('Like', style: TextStyle(color: Colors.brown)),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.comment, color: Colors.brown),
                          label: const Text('Comment', style: TextStyle(color: Colors.brown)),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.share, color: Colors.brown),
                          label: const Text('Share', style: TextStyle(color: Colors.brown)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
