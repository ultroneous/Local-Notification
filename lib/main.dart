import 'package:flutter/material.dart';
import 'package:local_notification/local_notification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Notifications",
      debugShowCheckedModeBanner: false,
      home: LocalNotification(),
    );
  }
}
