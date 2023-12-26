import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onTap;
  final Function(Todo) onDelete;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onTap,
    required this.onDelete
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap(todo);
      },
      leading: todo.isDone
          ? const Icon(
              Icons.check_circle,
              color: Colors.brown,
            )
          : const Icon(Icons.check_circle_outline),
      title: Text(
        todo.title,
        style: TextStyle(color: todo.isDone ? Colors.grey : Colors.brown),
      ),
      subtitle: Text(
        DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(
          todo.dateTime,
        )),
        style: TextStyle(color: todo.isDone ? Colors.grey : Colors.brown),
      ),
      trailing: todo.isDone
          ? GestureDetector(
              onTap: () {
                onDelete(todo);
              },
              child: const Icon(Icons.delete_forever),
            )
          : null,
    );
  }
}