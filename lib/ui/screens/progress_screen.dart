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
      body: Column(
        children: [
          SizedBox(height: 15),
          SizedBox(
            height: 90,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return TaskCount(title: 'Progress', count: index + 5);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 1);
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder:(context,index){
                return TaskCard();
              } , separatorBuilder: (context,index){
              return SizedBox(height: 4,);
            }, ),
          ),

        ],
      ),
    );
  }
}


