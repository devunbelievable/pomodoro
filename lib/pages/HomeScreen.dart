import 'package:flutter/material.dart';
import 'package:pomodoro/widgets/home/AddTask.dart';
import 'package:pomodoro/widgets/home/DisplayTime.dart';
import 'package:pomodoro/widgets/ListTask.dart';

class HomeScreen extends StatefulWidget {
  final int mainColor;
  final int secondaryColor;
  final Function(int) func;

  const HomeScreen({
    super.key,
    required this.mainColor,
    required this.secondaryColor,
    required this.func,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Focus Your Task',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(widget.secondaryColor),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => AddTask(
                  mainColor: widget.mainColor,
                  secondaryColor: widget.secondaryColor,
                ),
              );
            },
            icon: Icon(Icons.add_task_outlined, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        color: Color(widget.mainColor),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              //Display time:Pomodoro, Short Break, Long Break
              DisplayTime(
                mainColor: widget.mainColor,
                secondaryColor: widget.secondaryColor,
                func: (value) {
                  widget.func(value);
                },
              ),
              //List Tasks todo and completed(During the day)
              ListTask(
                mainColor: widget.mainColor,
                todo: 0xffffffff,
                completed: 0xffff5a5a5a,
                secondaryColor: widget.secondaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
