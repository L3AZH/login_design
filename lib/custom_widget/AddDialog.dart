

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_design/custom_widget/CustomButton1.dart';
import 'package:login_design/custom_widget/CustomTextField1.dart';
import 'package:login_design/db/DbHelper.dart';
import 'package:login_design/db/model/ContactModel.dart';

class AddDialog extends StatelessWidget{

  TextEditingController? textEditingControllername;
  TextEditingController? textEditingControllerphone;

  AddDialog({
    required TextEditingController textEditingControllername,
    required TextEditingController textEditingControllerphone}){
    this.textEditingControllername = textEditingControllername;
    this.textEditingControllerphone = textEditingControllerphone;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add contact dialog"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            CustomTextField1(
              hint: "name",
              controller: textEditingControllername,
            ),
            CustomTextField1(
              hint: "phone",
              controller: textEditingControllerphone,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        CustomButton1(
          name: "save",
          onPress: (){
            String? name = textEditingControllername?.text;
            String? phone = textEditingControllerphone?.text;
            if(name != null && phone !=null){
              Contact newContact = Contact(name: name,phonenumber: phone);
              addContact(newContact,context);
            }
          },
        ),
        CustomButton1(
         name: "cancel",
         onPress: (){
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }

  void addContact(Contact contact,BuildContext context) async{
    await ContactsDatabase.instance.addContact(contact);
    textEditingControllername?.text = "";
    textEditingControllerphone?.text = "";
    Navigator.of(context).pop();
  }
}