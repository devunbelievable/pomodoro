import 'package:flutter/material.dart';

class ListTask extends StatefulWidget {
  final int todo;
  final int completed;
  final int mainColor;
  final int secondaryColor;
  const ListTask({
    super.key,
    required this.todo,
    required this.completed,
    required this.mainColor,
    required this.secondaryColor,
  });

  @override
  State<ListTask> createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(widget.secondaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView(
          children: [
            Card(
              color: Color(widget.mainColor),
              child: ListTile(
                leading: Icon(
                  Icons.radio_button_unchecked,
                  color: Color(widget.todo),
                ),
                title: Text(
                  'Học Flutter',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(Icons.more_vert, color: Color(widget.todo)),
              ),
            ),
            Card(
              color: Color(widget.mainColor).withOpacity(0.2),
              child: ListTile(
                leading: Icon(
                  Icons.check_circle_outline,
                  color: Color(widget.secondaryColor),
                ),
                title: Text(
                  'Học Spring Boot',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                trailing: Icon(
                  Icons.more_vert,
                  color: Color(widget.secondaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
