import 'package:flutter/material.dart';
import 'package:todo_app/models/task_group.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/repository/supabase_repository.dart';

class TaskProvider extends ChangeNotifier {
  final _repo = SupabaseRepository();

  List<Task> _task = [];
  List<Task> get task => _task;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> listTaskByGroups(String groupId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _task = await _repo.listTaskByGroups(groupId);
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
