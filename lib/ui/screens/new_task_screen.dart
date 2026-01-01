import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/services/api_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/provider/task_provider.dart';
import 'package:task_manager/ui/widgets/show_snack_bar_message.dart';

import '../../data/models/task_status_count_model.dart';
import '../widgets/TaskCard.dart';
import '../widgets/task_aap_bar.dart';
import '../widgets/task_count.dart';
import 'add_new_task_screen.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  bool _getNewTaskProgress = false;

  List<TaskModel> _newTaskList = [];
  Future<void> loadData()async {
    final taskProvide = Provider.of<TaskProvider>(context, listen: false);
    taskProvide.fetchTaskStatusCount();

  }

  Future<void> _getAllNewTask() async {
    _getNewTaskProgress = true;
    setState(() {});
    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.newTaskUrls,
    );
    _getNewTaskProgress = false;
    setState(() {});
    List<TaskModel> list = [];

    if (response.isSuccess) {
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }
    } else {
      showSnackBarMessage(context, response.errorMessage.toString());
    }
    _newTaskList = list;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    _getAllNewTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMApp_bar(),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          return Column(
            children: [
              SizedBox(height: 15),
              SizedBox(
                height: 90,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: taskProvider.taskStatusCount.length,
                    itemBuilder: (context, index) {
                      final counts = taskProvider.taskStatusCount;
                      return TaskCount(
                        title: counts[index].status,
                        count: counts[index].count,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 1);
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: _newTaskList.length,
                  itemBuilder: (context, index) {
                    return TaskCard(
                      taskModel: _newTaskList[index],
                      cardColor: Colors.blueAccent,
                      refreshParent: () {
                        _getAllNewTask();
                        loadData();
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 4);
                  },
                ),
              ),
            ],
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewTaskScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
