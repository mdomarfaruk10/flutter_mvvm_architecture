


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/view_models/user_view_models.dart';

import '../../model/userModel.dart';
import '../../utils/routes/routes_name.dart';

class SplashServices{
  Future<UserModel> getUserDate() => UserViewModels().getUser();

  void checkAuthentication(BuildContext context) async{
    getUserDate().then((value) {

      if(value.token == null || value.token == ''){
        Navigator.pushNamed(context,RoutesName.login);
      }else{
        Navigator.pushNamed(context,RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if(kDebugMode){
        print(error.toString());
      }
    });
  }

}