import 'package:flutter/material.dart';
import 'package:login_design/db/DbHelper.dart';
import 'package:login_design/db/model/ContactModel.dart';

class ItemListContact extends StatelessWidget{

  Contact? contact;

  ItemListContact({
    required Contact contact,
  }){
    this.contact = contact;
  }

  Future<int> deleteContact(Contact contact) async{
    return await ContactsDatabase.instance.deleteContact(contact);
  }

  void updateContact(Contact contact) async{
    await ContactsDatabase.instance.updateContact(contact);
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.all(15),
      child: Card(
        color: Colors.lightBlueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "ID: ${this.contact!.id}",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Infor: ${this.contact!.name}:${this.contact!.phonenumber}",
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.delete),
                    onPressed:(){
                      try{
                        deleteContact(contact!).then((value) =>{
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Result delete : ${value}")))
                        });
                      }
                      catch(e){
                        print(e);
                      }
                    }),
                IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: null),
              ],
            )
          ],
        )
      ),
    );
  }
}