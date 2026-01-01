import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_manager/core/enums/api_state.dart';

import '../data/models/task_model.dart';
import '../data/models/task_status_count_model.dart';
import '../data/services/api_caller.dart';
import '../data/utils/urls.dart';

class TaskProvider extends ChangeNotifier{
  List<TaskModel> _newTask = [];
  List<TaskModel> _progressTask = [];
  List<TaskModel> _completedTask = [];
  List<TaskModel> _cancelTask = [];

  List<TaskStatusCountModel> _taskStatusCount = [];

  ApiState _taskListState = ApiState.initial;
  ApiState _taskCountState = ApiState.initial;
  String ? _errorMessage;


  List<TaskModel> get newTask => _newTask;
  List<TaskModel> get progressTask => _progressTask;
  List<TaskModel> get completedTask => _completedTask;
  List<TaskModel> get cancelTask => _cancelTask;
  List<TaskStatusCountModel> get taskStatusCount => _taskStatusCount;


  Future<void> fetchTaskStatusCount() async {
    _taskCountState = ApiState.loading;
    notifyListeners();
    final ApiResponse response = await ApiCaller.getRequest(
        url: Urls.taskCountUrls);
    if (response.isSuccess){
      _taskStatusCount = [];
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        _taskStatusCount.add(TaskStatusCountModel.formJson(jsonData));}
      _taskCountState = ApiState.success;
      _errorMessage = null;
    }else {
    _taskCountState = ApiState.error;
    _errorMessage = response.errorMessage??'Failed to Fetch Task Count';
    }
    notifyListeners();

    }
  Future<void> fetchNewTaskByStatus() async {
    _taskListState = ApiState.loading;
    notifyListeners();
    final ApiResponse response = await ApiCaller.getRequest(
        url: Urls.newTaskUrls);
    if (response.isSuccess){
      _taskStatusCount = [];
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        _taskStatusCount.add(TaskStatusCountModel.formJson(jsonData));}
      _taskCountState = ApiState.success;
      _errorMessage = null;
    }else {
      _taskCountState = ApiState.error;
      _errorMessage = response.errorMessage??'Failed to Fetch Task Count';
    }
    notifyListeners();

  }


}