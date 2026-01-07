import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Map<String, String>> notifications = [
    {
      'title': 'New Message',
      'body': 'You have received a new message from John',
      'time': '2 min ago',
    },
    {
      'title': 'Order Update',
      'body': 'Your order #1234 has been shipped',
      'time': '1 hour ago',
    },
    {
      'title': 'Payment Success',
      'body': 'Your payment was completed successfully',
      'time': 'Yesterday',
    },
    {
      'title': 'Reminder',
      'body': 'Don’t forget your meeting at 4 PM',
      'time': 'Today',
    },
    {
      'title': 'Offer',
      'body': 'Get 20% off on your next purchase',
      'time': '2 days ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];

          return Card(
            elevation: 6,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

              /// Leading icon with background
              leading: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.blue.shade100,
                child: const Icon(
                  Icons.notifications,
                  color: Colors.blue,
                ),
              ),

              title: Text(
                notification['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  notification['body']!,
                  style: const TextStyle(color: Colors.black87),
                ),
              ),

              /// Time
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    notification['time']!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Icon(Icons.chevron_right, size: 18),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
