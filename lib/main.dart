import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/provider/auth_provider.dart';

import 'aap.dart';


void main(){
  runApp(
        MultiProvider(providers: [
        ChangeNotifierProvider(create: (_)=>AuthProvider())

        ],
        child: TaskManagerApp(),
        ),


      );
}