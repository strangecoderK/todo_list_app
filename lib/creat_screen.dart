import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/main.dart';
import 'package:todo_list/todo.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  DateTime dateTimeCalender = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2200),
    ).then((value) {
      setState(() {
        dateTimeCalender = value!;
        print('Here dateTimeCalendar $dateTimeCalender');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'write what to do',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
        actions: [
          IconButton(
            onPressed: () async {
              await todos.add(Todo(
                  title: _textController.text,
                  dateTime: dateTimeCalender.millisecondsSinceEpoch));

              if (mounted) {
                Navigator.pop(context);
              }
            },
            icon: Icon(
              Icons.done,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: _showDatePicker,
                  child: Text(
                    'choose date :',
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
                Text(
                  '${DateFormat('yyyy-MM-dd').format(dateTimeCalender)}',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: '할일을 입력하세요',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.pink[50]),
            ),
          ],
        ),
      ),
    );
  }
}
