import 'package:flutter/material.dart';
import 'package:mvvm/utils/utils.dart';
import '../res/component/round_button.dart';
import '../utils/routes/routes_name.dart';
import '../view_models/auth_view_model.dart';
import 'package:provider/provider.dart';
class loginView extends StatefulWidget {
  const loginView({Key? key}) : super(key: key);

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
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
              title: "Submit",
              loading: authViewMode.loading,
              onPess: (){
                if(_emailController.text.isEmpty){
                  Utils.FlushBerErrorMessage("Please Enter Email address", context);
                }else if(_passwordController.text.isEmpty){
                  Utils.FlushBerErrorMessage("Please Enter password", context);
                }else if(_passwordController.text.length < 6 ){
                  Utils.FlushBerErrorMessage("Please Enter 6 digit password", context);
                }else{
                  // Map data = {
                  //   'email': _emailController.text.toString(),
                  //   'password': _emailController.text.toString(),
                  // };

                  Map data = {
                    'email': "eve.holt@reqres.in",
                    'password': "cityslicka",
                  };
                  authViewMode.loginApi(data,context);
                }

              },
            ),

            SizedBox(height: 50,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.signUp);
              },
              child: Center(
                child: Text("Create account ? SingUp"),
              ),
            )

          ],
        ),
      ),
    );
  }
}



