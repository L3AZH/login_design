import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/ProviderModel.dart';

class InfoScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final inforScreen = Provider.of<ProviderModel>(context);
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            "Username: ${inforScreen.getUsername()}",
            style: TextStyle(
                fontSize: 25
            ),
          ),
          margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            "Password: ${inforScreen.getPassword()}",
            style: TextStyle(
                fontSize: 25
            ),
          ),
          margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
        ),
      ],
    );
  }
}