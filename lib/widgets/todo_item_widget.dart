import 'package:flutter/material.dart';
import 'package:workspaceflutter/models/todo_item.dart';

class TodoItemWidget extends StatelessWidget {
  final TodoItem item;
  final Function(TodoItem) onToggle;
  final Function(TodoItem) onDelete;

  TodoItemWidget({required this.item, required this.onToggle, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: item.isCompleted,
        onChanged: (value) => onToggle(item),
      ),
      title: Text(
        item.title,
        style: TextStyle(
          decoration: item.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () => onDelete(item),
      ),
    );
  }
}