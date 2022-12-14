import 'package:flutter/material.dart';

import '../view_models/services/splash_services.dart';


class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  SplashServices splashServices = SplashServices();
  void initState(){
    super.initState();
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash screen",style: TextStyle(color: Colors.red),),
      ),
    );
  }
}

