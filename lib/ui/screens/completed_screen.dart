import 'package:flutter/material.dart';

import '../widgets/TaskCard.dart';
import '../widgets/task_aap_bar.dart';
import '../widgets/task_count.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMApp_bar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return TaskCard(status: 'Completed', cardColor: Colors.green);
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
