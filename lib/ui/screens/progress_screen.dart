import 'package:flutter/material.dart';

import '../widgets/TaskCard.dart';
import '../widgets/task_aap_bar.dart';
import '../widgets/task_count.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMApp_bar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return TaskCard(status: 'Progress', cardColor: Colors.purpleAccent);
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 10);
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
