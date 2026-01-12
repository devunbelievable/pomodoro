import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class DashboardScreen extends StatefulWidget {
  final int mainColor;
  final int secondaryColor;
  final Function(int) func;

  const DashboardScreen({
    super.key,
    required this.mainColor,
    required this.secondaryColor,
    required this.func,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _fullScreenCBox = false;
  bool _hideStatusBarCBox = false;
  bool _hideNavagatorBarCBox = false;

  void setFullScreen(value) {
    setState(() {
      _fullScreenCBox = value ?? false;
    });
  }

  void setHideStatusBar(value) {
    setState(() {
      _hideStatusBarCBox = value ?? false;
    });
  }

  void setHideNavagatorBar(value) {
    setState(() {
      _hideNavagatorBarCBox = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(widget.secondaryColor),
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color(widget.mainColor),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              Text(
                'Screen mode',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Row(
                children: [
                  Switch(
                    activeColor: Colors.black,
                    value: _fullScreenCBox,
                    onChanged: (bool? value) => setFullScreen(value),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Full Screen',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Switch(
                    activeColor: Colors.black,
                    value: _hideStatusBarCBox,
                    onChanged: (bool? value) => setHideStatusBar(value),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Only hide status bar',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Switch(
                    activeColor: Colors.black,
                    value: _hideNavagatorBarCBox,
                    onChanged: (bool? value) => setHideNavagatorBar(value),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Only hide navigation bar',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              Divider(indent: 100, endIndent: 100),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Color(widget.secondaryColor),
            onPressed: () {},
            child: Icon(Icons.mail_outline, size: 50, color: Colors.white),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Color(widget.secondaryColor),
            onPressed: () {},
            child: Icon(Icons.telegram_outlined, size: 50, color: Colors.white),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Color(widget.secondaryColor),
            onPressed: () {},
            child: Icon(Icons.link, size: 50, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
