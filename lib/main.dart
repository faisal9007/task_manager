import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/provider/auth_provider.dart';
import 'package:task_manager/provider/network_provider.dart';

import 'aap.dart';


void main(){
  runApp(
        MultiProvider(providers: [
        ChangeNotifierProvider(create: (_)=>AuthProvider()),
          ChangeNotifierProvider(create: (_)=>NetworkProvider())

        ],
        child: TaskManagerApp(),
        ),


      );
}