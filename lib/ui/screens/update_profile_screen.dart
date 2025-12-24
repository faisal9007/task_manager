import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager/data/models/user_model.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';


import '../widgets/photo_picker.dart';
import '../widgets/task_aap_bar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  TextEditingController  emailController = TextEditingController();
  TextEditingController  firstNameController = TextEditingController();
  TextEditingController  lastNameController = TextEditingController();
  TextEditingController  mobileController = TextEditingController();
  TextEditingController  passwordController = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();

  XFile? _selectedImage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserModel user = AuthController.userModel!;
    emailController.text=user.email;
    firstNameController.text=user.firstName;
    lastNameController.text=user.lastName;
    mobileController.text=user.mobile;


  }

  Future<void> _pickImage() async {
    final XFile? image =
    await _imagePicker.pickImage(source: ImageSource.camera);
    if(image != null){
      _selectedImage = image;
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMApp_bar(),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                'Update Profile',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              PhotoPicker(
                onTap: _pickImage,
                selectedPhoto: _selectedImage,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(hintText: 'First name'),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(hintText: 'Last name'),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: mobileController,
                decoration: InputDecoration(hintText: 'Mobile'),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(
                height: 16,
              ),
              FilledButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_circle_right_outlined)),
              const SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}