
import 'package:flutter/material.dart';
import 'package:login_design/custom_widget/CustomButton1.dart';
import 'package:login_design/custom_widget/CustomTextField1.dart';
import 'package:login_design/provider/ProviderModel.dart';
import 'package:login_design/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

class LoginScreen extends StatelessWidget{

  final textField1Controller = TextEditingController();
  final textField2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginScreenModel = Provider.of<ProviderModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Login screen"),),
      body: Column(
        children: <Widget>[
          CustomTextField1(
            hint: "Username",
            controller: textField1Controller,
          ),
          CustomTextField1(
            hint: "Password",
            controller: textField2Controller,
          ),
          CustomButton1(
            name: "Login",
            onPress: (){
              String username = textField1Controller.text;
              String password = textField2Controller.text;
              loginScreenModel.setUsername(username);
              loginScreenModel.setPassword(password);
              if(username == "admin"){
                if(password == "admin"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen())
                  );
                }
                else{
                  ScaffoldMessenger
                      .of(context)
                      .showSnackBar(SnackBar(content: Text("Wrong password !!")));
                }
              }
              else{
                ScaffoldMessenger
                    .of(context)
                    .showSnackBar(SnackBar(content: Text("Invalid username or password")));
              }
            },
          ),
          Text(
              "Create new account now !! ${loginScreenModel.getUsername()}",
              style: TextStyle(
                fontSize: 15
              ),
          ),
        ],
      ),
    );
  }

}
