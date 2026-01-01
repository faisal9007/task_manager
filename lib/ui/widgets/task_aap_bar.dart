import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/provider/auth_provider.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';

import '../screens/update_profile_screen.dart';

class TMApp_bar extends StatelessWidget implements PreferredSizeWidget {
  const TMApp_bar({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userModel = authProvider.userModel;
    final profilePhoto = userModel?.photo ?? '';
    return AppBar(
      backgroundColor: Colors.brown,
      title: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UpdateProfileScreen()),
          );
        },
        child: Row(
          children: [
            CircleAvatar(child: profilePhoto.isNotEmpty? Image.memory(jsonDecode(profilePhoto)): Icon(Icons.person),radius: 25),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${userModel!.firstName} ${userModel.lastName}',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(color: Colors.white),
                ),
                Text(
                  userModel.email,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            authProvider.logout();
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/Login Screen',
              (predicate) => false,
            );
          },
          icon: Icon(Icons.logout),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
