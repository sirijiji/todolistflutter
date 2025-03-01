import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:workspaceflutter/models/todo_item.dart';

class StorageService {
  static const String _key = 'todo_items';

  Future<void> saveTodos(List<TodoItem> todos) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(todos.map((item) => item.toJson()).toList());
    await prefs.setString(_key, jsonString);
  }

  Future<List<TodoItem>> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => TodoItem.fromJson(json)).toList();
    }
    return [];
  }
}