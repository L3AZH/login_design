import 'package:flutter/material.dart';
import 'package:login_design/provider/ProviderModel.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';
void main(){
  runApp(HomeLogin());
}

class HomeLogin extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderModel>(create: (context) => ProviderModel()),
      ],
      child: MaterialApp(
        title: "Login screen",
        home: LoginScreen(),
      ),
    );
  }
}