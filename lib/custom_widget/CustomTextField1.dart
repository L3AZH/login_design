import 'package:flutter/material.dart';

class CustomTextField1 extends StatelessWidget{
  String? _hint;

  TextEditingController? myController;

  CustomTextField1({String? hint, TextEditingController? controller}){
    this._hint = hint;
    this.myController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(15),
      child: TextField(
        decoration: InputDecoration(
          hintText: this._hint,
          border: OutlineInputBorder(),
        ) ,
        controller: this.myController,
        keyboardType: TextInputType.phone,
      ),
    );
  }
}