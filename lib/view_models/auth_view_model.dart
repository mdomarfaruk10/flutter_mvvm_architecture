import 'package:flutter/cupertino.dart';
import 'package:mvvm/respository/auth_repository.dart';
import 'package:mvvm/utils/utils.dart';
import '../utils/routes/routes_name.dart';

class AuthViewModel extends ChangeNotifier{

   final _myRepo = AuthRepository();

   bool _isloading = false;


   bool get loading => _isloading;

   setLoading(bool value){
     _isloading = value;
     notifyListeners();
   }


   Future<void> loginApi(dynamic data,BuildContext context) async{

     setLoading(true);
      _myRepo.loginApi(data).then((value) {
        setLoading(false);
         Utils.toastMessage(value.toString());
         print(value.toString());
         Navigator.pushNamed(context,RoutesName.home);

      }).onError((error, stackTrace){
         setLoading(false);
          print(error.toString());
          Utils.toastMessage(error.toString());

      });
   }


   Future<void> registerApi(dynamic data,BuildContext context) async{

     setLoading(true);
     _myRepo.registerApi(data).then((value) {
       setLoading(false);
       Utils.toastMessage(value.toString());
       print(value.toString());
       Navigator.pushNamed(context,RoutesName.login);

     }).onError((error, stackTrace){
       setLoading(false);
       print(error.toString());
       Utils.toastMessage(error.toString());

     });
   }


}