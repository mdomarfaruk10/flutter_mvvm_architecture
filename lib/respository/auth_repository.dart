


import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiServices.dart';
import 'package:mvvm/res/app_url.dart';

class AuthRepository{
  BaseApiServices _apiServices = NetworkApiServices();

   Future<dynamic> loginApi(dynamic data)async{
     try{
       dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEntPoint, data);
       return response;
     }catch(e){
       throw e;
     }
   }

  Future<dynamic> registerApi(dynamic data)async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registationEntPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }

}