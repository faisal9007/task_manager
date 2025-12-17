import 'package:flutter/material.dart';
import 'package:task_manager/data/services/api_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/task_aap_bar.dart';

import '../widgets/show_snack_bar_message.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMApp_bar(),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Text(
                    'Add New Task',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: subjectController,
                    decoration: InputDecoration(hintText: 'Subject'),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Subject Line';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: descriptionController,
                    maxLines: 7,
                    decoration: InputDecoration(hintText: 'Descriptions'),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        addNewTask();
                      }
                    },
                    child: Icon(Icons.arrow_circle_right_outlined, size: 30),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _addTaskProgress = false;
  Future<void> addNewTask() async {
    _addTaskProgress = true;
    setState(() {});
    Map<String, dynamic> requestBody = {
      "title": subjectController.text,
      "description": descriptionController.text,
      "status": "New",
    };
    final ApiResponse response = await ApiCaller.postRequest(
      url: Urls.createTaskUrls,
      body: requestBody,
    );
    _addTaskProgress = false;
    setState(() {});
    if (response.isSuccess) {
      _clearField();
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/Main Navigation',
        (predicate) => false,
      );
      showSnackBarMessage(context, 'New Task Added');
    } else {
      showSnackBarMessage(context, response.errorMessage!);
    }
  }

  _clearField() {
    subjectController.clear();
    descriptionController.clear();
  }
}
