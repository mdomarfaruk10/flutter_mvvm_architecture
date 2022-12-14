

import 'package:flutter/cupertino.dart';
import 'package:mvvm/model/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserViewModels with ChangeNotifier{

  Future<bool> saveUser(UserModel  user)async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    // sp.setString('userName', user.userName.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString("token");
    return UserModel(
      token: token.toString(),
    );
  }

  Future<bool> remove()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.remove('token');
  }

}