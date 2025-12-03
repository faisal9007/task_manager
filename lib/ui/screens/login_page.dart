import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';

import '../widgets/screen_background.dart';
import 'forget_password_email_varify.dart';
import 'main_nav_bar_holder_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    void _onTabSignUp(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
    }
    void _onTapForgetPassword (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordEmailVarify()));
    }
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 150,),
                Text(
                  'Get Started With',
                  style: Theme.of(context).textTheme.titleLarge
                ),
                const SizedBox(height: 25,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Password'
                  ),
                ),
                const SizedBox(height: 20,),
               FilledButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MainNavBarHolderScreen()));
                    },
                    child: Icon(Icons.double_arrow_outlined,
                    size: 30,
                    ),
                  ),
            
                const SizedBox(height: 35,),
                Center(
                  child: Column(
                    children: [
                      TextButton(onPressed: (){_onTapForgetPassword();}, child: Text('Forget Password?'),),
                      SizedBox(height: 5),
                      RichText(
                        text: TextSpan(
                          text: "Don't have account?",
                          children: [
                            TextSpan(
                              text: 'SignUp',
                              style: TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()..onTap = _onTabSignUp
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
                )
            
              ],
            ),
          ),
        ),
      ),
    );

  }
}
