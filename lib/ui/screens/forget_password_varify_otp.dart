import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/reset_password_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/screen_background.dart';
import 'forget_password_varify_otp.dart';
import 'login_page.dart';

class ForgetPasswordVarifyOtp extends StatelessWidget {
  const ForgetPasswordVarifyOtp({super.key});

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
                  'PIN Varification',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  'A 6 digit OTP sent to your email',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey
                  ),
                ),
                const SizedBox(height: 25),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    inactiveColor: Colors.grey.shade200,
                    selectedColor: Colors.brown
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,

                  appContext: context,




                ),

                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () {   Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPasswordScreen()));
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
