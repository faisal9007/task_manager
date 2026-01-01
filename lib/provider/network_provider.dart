import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/core/enums/api_state.dart';
import 'package:task_manager/data/models/user_model.dart';

import '../data/services/api_caller.dart';
import '../data/utils/urls.dart';

class NetworkProvider extends ChangeNotifier {
 ApiState _loginState = ApiState.initial;
 ApiState _registrationState = ApiState.initial;
 ApiState _profileUpdateState = ApiState.initial;

 String? _errorMessage;

 ApiState get loginState => _loginState;
 ApiState get registrationState => _registrationState;
 ApiState get profileUpdateState => _profileUpdateState;
 String? get errorMessage => _errorMessage;

 Future<Map<String,dynamic>?> login({
   required String email,
   required String password,
}) async {
   Map<String, dynamic> requestBody = {
     "email": email,
     "password": password,
   };
   final ApiResponse response = await ApiCaller.postRequest(
     url: Urls.loginUrls,
     body: requestBody,
   );
   if (response.isSuccess){
     _loginState =ApiState.success;
     notifyListeners();
     return{
        'user': UserModel.fromJson(response.responseData['data']),
       'token': response.responseData['token']
     };
   }else{
     _loginState = ApiState.error;
     _errorMessage = response.errorMessage?? 'login failed';
     notifyListeners();
     return null;
   }
 }

}