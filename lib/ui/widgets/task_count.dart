import 'package:flutter/material.dart';
class TaskCount extends StatelessWidget {
  const TaskCount({
    super.key, required this.title, required this.count,
  });
  final String title;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Card(

      elevation: 0,
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 8),
        child: Column(
          children: [
            Text(count.toString(), style: Theme.of(context).textTheme.titleLarge),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}