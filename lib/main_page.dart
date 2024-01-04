import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo_list/creat_screen.dart';
import 'package:todo_list/todo_item.dart';

import 'main.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'What to do!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'asset/elephant.png',
          ),
          ListView(
            children: todos.values
                .map(
                  (e) => Container(
                    margin: EdgeInsets.all(7.0),
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      border: Border.all(color: Colors.brown),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TodoItem(
                      todo: e,
                      onTap: (todo) async {
                        todo.isDone = !todo.isDone;
                        await todo.save();
                        setState(() {});
                      },
                      onDelete: (todo) async {
                        await todo.delete();
                        setState(() {});
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateScreen()),
          );

          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
