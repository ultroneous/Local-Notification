import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification extends StatefulWidget {
  const LocalNotification({Key? key, String? payload}) : super(key: key);

  @override
  LocalNotificationState createState() => LocalNotificationState();
}

class LocalNotificationState extends State<LocalNotification> {
  FlutterLocalNotificationsPlugin? localNotification;
  @override
  void initState() {
    super.initState();
    var androidInitilize = const AndroidInitializationSettings('logo');
    var iOSinitilize = const IOSInitializationSettings();
    var initilizationsSettings =
        InitializationSettings(android: androidInitilize, iOS: iOSinitilize);
    localNotification = FlutterLocalNotificationsPlugin();
    localNotification!.initialize(initilizationsSettings,
        onSelectNotification: notificationSelected);
  }

  Future _showNotification() async {
    var androiddetails = const AndroidNotificationDetails(
        "Channel ID", "ultroNeous",
        importance: Importance.max);
    var iOSDetails = const IOSNotificationDetails();
    var generalNotificationDetails =
        NotificationDetails(android: androiddetails, iOS: iOSDetails);
    await localNotification!
        .show(0, "Task", "You created a Task", generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: _showNotification,
        child: const Text("flutter Notifications"),
      )),
    );
  }

  Future notificationSelected(String? payload) async {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return LocalNotification(
        payload: payload,
      );
    }));
  }
}
