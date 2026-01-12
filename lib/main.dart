import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoro/MainWrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(
    // SystemUiMode.immersiveSticky,//Ẩn cả navigation bar và status bar, người dùng vuốt lên vẫn hiện tạm thời
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top], //// chỉ hiện status bar, ẩn navigation bar
  );

  AwesomeNotifications().initialize('resource://drawable/pomodoro_48', [
    NotificationChannel(
      channelKey: 'basic_channel_v2',
      channelName: 'Basic Notifications',
      channelDescription: 'Notification for demo',
      playSound: true,
      soundSource: 'resource://raw/click',
      importance: NotificationImportance.High,
    ),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: MainWrapper(),
    );
  }
}
