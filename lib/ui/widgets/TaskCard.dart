import 'package:flutter/material.dart';
class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black12,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListTile(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8)
          ),
          title: Text(
            'This is Task Title',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('This is Description'),
              Text('23/9/25'),
              Row(
                children: [
                  Chip(
                    label: Text('New'),
                    backgroundColor: Colors.brown,
                    labelStyle: TextStyle(color: Colors.white),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(25),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit, color: Colors.green),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}