import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/pages/DashboardScreen.dart';
import 'package:pomodoro/pages/HistoryScreen.dart';
import 'package:pomodoro/pages/HomeScreen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;

  int mainColor = 0xffaf4d4d;
  int secondaryColor = 0xffb75f5f;

  void _changeColor(int tab) {
    if (tab == 2) {
      setState(() {
        mainColor = 0xff2f7c81;
        secondaryColor = 0xff44898e;
      });
    } else if (tab == 3) {
      setState(() {
        mainColor = 0xff356a92;
        secondaryColor = 0xff4a799d;
      });
    } else {
      setState(() {
        mainColor = 0xffaf4d4d;
        secondaryColor = 0xffb75f5f;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(
        mainColor: mainColor,
        secondaryColor: secondaryColor,
        func: (value) {
          _changeColor(value);
        },
      ),
      HistoryScreen(mainColor: mainColor, secondaryColor: secondaryColor),
      DashboardScreen(
        mainColor: mainColor,
        secondaryColor: secondaryColor,
        func: (value) {
          _changeColor(value);
        },
      ),
    ];
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(secondaryColor),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),

        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, color: Colors.white),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined, color: Colors.white),
            label: 'Dashboard',
          ),
        ],
      ),
    );
  }
}
