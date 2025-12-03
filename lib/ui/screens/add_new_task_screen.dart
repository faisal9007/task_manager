import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/task_aap_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMApp_bar(),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Text('Add New Task', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Subject',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                maxLines: 7,
                decoration: InputDecoration(
                  hintText: 'Descriptions',
                ),
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () {},
                child: Icon(Icons.arrow_circle_right_outlined, size: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
