import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:login_design/custom_widget/ItemListContact.dart';
import 'package:login_design/db/DbHelper.dart';
import 'package:login_design/provider/ProviderModel.dart';
import 'package:provider/provider.dart';

class MyListScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final logger = Logger();
    logger.i("this shit must run");
    final myListScreenModel = Provider.of<ProviderModel>(context);
    myListScreenModel.initList();
    if(myListScreenModel.listContact.length>0){
      return ListView.builder(
          itemCount: myListScreenModel.listContact.length,
          itemBuilder: (BuildContext context, int index){
            return ItemListContact(
                contact: myListScreenModel.listContact.elementAt(index)
            );
          });
    }
    else{
      return Center(
        child: Text("List is Empty !!"),
      );
    }
    // return Center(
    //   child: Text("List is Empty !!"),
    // );
  }
}