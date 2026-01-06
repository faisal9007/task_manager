import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/task_model.dart';
import '../../data/services/api_caller.dart';
import '../../data/utils/urls.dart';
import '../../provider/task_provider.dart';
import '../widgets/TaskCard.dart';
import '../widgets/show_snack_bar_message.dart';
import '../widgets/task_aap_bar.dart';
import '../widgets/task_count.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  Future<void> loadData()async {
    final taskProvide = Provider.of<TaskProvider>(context, listen: false);
    Future.wait([
      taskProvide.fetchTaskStatusCount(),
      taskProvide.fetchNewTaskByStatus('Completed'),
    ]);


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMApp_bar(),
      body: Consumer<TaskProvider>(
          builder: (context, taskProvider, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView.separated(
              itemCount: taskProvider.completedTask.length,
              itemBuilder: (context, index) {
                return TaskCard(
                  taskModel: taskProvider.completedTask[index],
                  cardColor: Colors.blueAccent,
                  refreshParent: () {
                    loadData();
                  },
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 4);
              },
            ),
          );
        }
      ),
    );
  }
}
