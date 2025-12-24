import 'package:flutter/material.dart';

import '../../data/models/task_model.dart';
import '../../data/services/api_caller.dart';
import '../../data/utils/urls.dart';
import '../widgets/TaskCard.dart';
import '../widgets/show_snack_bar_message.dart';
import '../widgets/task_aap_bar.dart';
import '../widgets/task_count.dart';

class CancelledScreen extends StatefulWidget {
  const CancelledScreen({super.key});

  @override
  State<CancelledScreen> createState() => _CancelledScreenState();
}

class _CancelledScreenState extends State<CancelledScreen> {
  List<TaskModel> _cancelledTaskList = [];
  bool _getCancelledTaskProgress = false;
  Future<void> _getAllTask() async {
    _getCancelledTaskProgress = true;
    setState(() {});
    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.cancelledTaskUrls,
    );
    _getCancelledTaskProgress = false;
    setState(() {});
    List<TaskModel> list = [];

    if (response.isSuccess) {
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }
    } else {
      showSnackBarMessage(context, response.errorMessage.toString());
    }
    _cancelledTaskList = list;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMApp_bar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.separated(
          itemCount: _cancelledTaskList.length,
          itemBuilder: (context, index) {
            return TaskCard(
              taskModel: _cancelledTaskList[index],
              cardColor: Colors.redAccent,
              refreshParent: () {
                _getAllTask();
              },
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 4);
          },
        ),
      ),
    );
  }
}
