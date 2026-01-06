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
  Future<void> fetchNewTaskByStatus(String status) async {
    _taskListState = ApiState.loading;
    notifyListeners();
    String url;
    switch(status){
      case ('New'):
        url = Urls.newTaskUrls;
        case ('Progress'):
          url = Urls.progressTaskUrls;
          case ('Completed'):
            url = Urls.completedTaskUrls;
            case ('Cancelled'):
              url = Urls.cancelledTaskUrls;
              break;
              default:
                url = Urls.newTaskUrls;
    }

    
    final ApiResponse response = await
    ApiCaller.getRequest(url: url);
    if (response.isSuccess){
      List<TaskModel> tasks = [];
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        tasks.add(TaskModel.fromJson(jsonData));}
      switch(status){
        case ('New'):
          _newTask = tasks;
        case ('Progress'):
          _progressTask = tasks;
        case ('Completed'):
          _completedTask = tasks;
        case ('Cancelled'):
          _cancelTask = tasks;
          break;
        default:
          _newTask = tasks;
      }
      _taskListState = ApiState.success;
      _errorMessage = null;
    }else {
      _taskCountState = ApiState.error;
      _errorMessage = response.errorMessage??'Failed to Fetch Task ';
    }
    notifyListeners();

  }


}