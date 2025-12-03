import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import 'forget_password_varify_otp.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 150),
                Text(
                  'Set Password',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  'Password Should be 6 mixed character',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey
                  ),
                ),
                const SizedBox(height: 25),
                TextFormField(decoration: InputDecoration(hintText: 'Password')),
                const SizedBox(height: 16),
                TextFormField(decoration: InputDecoration(hintText: 'Confirm Password')),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                  },
                  child: Icon(Icons.double_arrow_outlined, size: 30),
                ),

                const SizedBox(height: 35),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 25),
                      RichText(
                        text: TextSpan(
                          text: "Don't Have an account?",
                          children: [
                            TextSpan(
                              text: 'SignIn',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
