import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class DisplayTime extends StatefulWidget {
  final int mainColor;
  final int secondaryColor;
  final Function(int) func;
  const DisplayTime({
    super.key,
    required this.func,
    required this.mainColor,
    required this.secondaryColor,
  });

  @override
  State<DisplayTime> createState() => _DisplayTimeState();
}

class _DisplayTimeState extends State<DisplayTime> {
  int currentMode = 1;
  static int initialSeconds = 25 * 60;

  Timer? _timer;
  int _remainingSeconds = initialSeconds;
  bool _isRunning = false;

  int get _getInitialSeconds {
    if (currentMode == 'Short Break') return 5 * 60;
    if (currentMode == 'Long Break') return 15 * 60;
    return 25 * 60;
  }

  void _toggleTimer() {
    if (_isRunning) {
      _pause();
    } else {
      _start();
    }
  }

  void _start() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 0) {
        timer.cancel();
        setState(() {
          _isRunning = false;
        });
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });

    setState(() {
      _isRunning = true;
    });
  }

  void _pause() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainSeconds = seconds % 60;

    return '${minutes.toString().padLeft(2, '0')}:'
        '${remainSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String getTimerText(int value) {
    if (value == 2) return '05:00';
    if (value == 3) return '15:00';
    return '25:00';
  }

  Future<void> showSimpleNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel_v2',
        title: 'Good job!',
        body: 'You have completed your task.',
        // icon: 'resource://drawable/alarm_clock_50',
        bigPicture: 'asset://assets/images/gatsby_cheers.jpg',
        notificationLayout: NotificationLayout.BigPicture,
        customSound: 'resource://raw/ring.mp3',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(widget.secondaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: currentMode == 1
                      ? Color(widget.mainColor)
                      : Colors.transparent,
                  borderRadius: currentMode == 1
                      ? BorderRadius.circular(8)
                      : BorderRadius.circular(0),
                ),
                child: GestureDetector(
                  child: Text(
                    'Pomodoro',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: currentMode == 1
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      currentMode = 1;
                      widget.func(currentMode);
                    });
                  },
                ),
              ),
              SizedBox(width: 5),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: currentMode == 2
                      ? Color(widget.mainColor)
                      : Colors.transparent,
                  borderRadius: currentMode == 2
                      ? BorderRadius.circular(8)
                      : BorderRadius.circular(0),
                ),
                child: GestureDetector(
                  child: Text(
                    'Short Break',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: currentMode == 2
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      currentMode = 2;
                      widget.func(currentMode);
                    });
                  },
                ),
              ),
              SizedBox(width: 5),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: currentMode == 3
                      ? Color(widget.mainColor)
                      : Colors.transparent,
                  borderRadius: currentMode == 3
                      ? BorderRadius.circular(8)
                      : BorderRadius.circular(0),
                ),
                child: GestureDetector(
                  child: Text(
                    'Long Break',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: currentMode == 3
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      currentMode = 3;
                      widget.func(currentMode);
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  getTimerText(currentMode),
                  style: TextStyle(
                    fontSize: 130,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: showSimpleNotification,
                child: Text(
                  'START',
                  style: TextStyle(
                    color: Color(widget.mainColor),
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
