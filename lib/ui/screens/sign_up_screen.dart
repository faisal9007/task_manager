import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import 'forget_password_varify_otp.dart';
import 'login_page.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void _onTabSignIn(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    }
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
                  'Join With Us',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 25),
                TextFormField(decoration: InputDecoration(hintText: 'Email')),
                const SizedBox(height: 16),
                TextFormField(decoration: InputDecoration(hintText: 'First Name')),
                const SizedBox(height: 16),
                TextFormField(decoration: InputDecoration(hintText: 'Last Name')),
                const SizedBox(height: 16),
                TextFormField(decoration: InputDecoration(hintText: 'Mobile')),
                const SizedBox(height: 16),
                TextFormField(decoration: InputDecoration(hintText: 'Password')),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordVarifyOtp()));
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
                                recognizer: TapGestureRecognizer()..onTap = _onTabSignIn
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
