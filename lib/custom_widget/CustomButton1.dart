import 'package:flutter/material.dart';

class CustomButton1 extends StatelessWidget{
  String? _nameBtn;
  Function? _onClickMethod;
  CustomButton1({required String? name, required Function? onPress}){
    this._nameBtn = name;
    this._onClickMethod = onPress;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black
        ),
        child: Text(this._nameBtn!),
        onPressed:()=>this._onClickMethod!(),
      ),
    );
  }
}