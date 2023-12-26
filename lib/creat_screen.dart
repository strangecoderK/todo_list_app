import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('write what to do',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.brown,
        actions: [
          IconButton(
            onPressed: () async {
              await todos.add(Todo(
                  title: _textController.text,
                  dateTime: DateTime.now().millisecondsSinceEpoch));
              if (mounted) {
                Navigator.pop(context);
              }
            },
            icon: Icon(Icons.done,color: Colors.white,),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
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
      ),
    );
  }
}
