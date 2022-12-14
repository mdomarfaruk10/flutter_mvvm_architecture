
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/component/round_button.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view_models/auth_view_model.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  ValueNotifier<bool> _obscureText = ValueNotifier<bool>(true);
  TextEditingController _emailController =TextEditingController();
  TextEditingController _passwordController =TextEditingController();
  @override
  FocusNode emailFocusNode= FocusNode();
  FocusNode passwordFocusNode= FocusNode();
  void disporse(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obscureText.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: InputDecoration(
                  hintText: "Email",
                  label:Text("Email"),
                  prefixIcon: Icon(Icons.email)
              ),
              onFieldSubmitted: (value){
                // FocusScope.of(context).requestFocus(passwordFocusNode);
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);

              },
            ),
            ValueListenableBuilder(
                valueListenable: _obscureText,
                builder: (context,value,chill){
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obscureText.value,
                    obscuringCharacter: "*",
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                        hintText: "Password",
                        label:Text("Password"),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                            onTap: (){
                              _obscureText.value = !_obscureText.value;
                            },
                            child: Icon( _obscureText.value? Icons.visibility_off:Icons.visibility))

                    ),
                  );
                }
            ),
            SizedBox(height: 50,),
            RoundButton(
              title: "Registration",
              loading: authViewMode.loading,
              onPess: (){
                if(_emailController.text.isEmpty){
                  Utils.FlushBerErrorMessage("Please Enter Email address", context);
                }else if(_passwordController.text.isEmpty){
                  Utils.FlushBerErrorMessage("Please Enter password", context);
                }else if(_passwordController.text.length < 6 ){
                  Utils.FlushBerErrorMessage("Please Enter 6 digit password", context);
                }else{
                  Map data = {
                    'email': _emailController.text.toString(),
                    'password': _emailController.text.toString(),
                  };
                  authViewMode.loginApi(data,context);
                }

              },
            ),

            SizedBox(height: 50,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.login);
              },
              child: Center(
                child: Text("allredy account create"),
              ),
            )

          ],
        ),
      ),
    );
  }
}


