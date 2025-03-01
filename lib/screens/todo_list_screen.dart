import 'package:flutter/material.dart';
import 'package:workspaceflutter/models/todo_item.dart';
import 'package:workspaceflutter/widgets/new_todo_dialog.dart';
import 'package:workspaceflutter/widgets/todo_item_widget.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<TodoItem> _todoItems = [];

  void _addTodoItem(String title) {
    setState(() {
      _todoItems.add(TodoItem(title: title));
    });
  }

  void _toggleTodoItem(TodoItem item) {
    setState(() {
      item.isCompleted = !item.isCompleted;
    });
  }

  void _deleteTodoItem(TodoItem item) {
    setState(() {
      _todoItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: _todoItems.length,
        itemBuilder: (context, index) {
          return TodoItemWidget(
            item: _todoItems[index],
            onToggle: _toggleTodoItem,
            onDelete: _deleteTodoItem,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => NewTodoDialog(onAdd: _addTodoItem),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}