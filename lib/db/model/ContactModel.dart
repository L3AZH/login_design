

import 'package:flutter/cupertino.dart';

final String tableContact = "contacts";

class ContactField{
  static final List<String> values = [id,name,phonenumber];

  static final String id = "_id";
  static final String name = "name";
  static final String phonenumber = "phonenumber";
}

class Contact{
  int? id;
  String? name;
  String? phonenumber;
  Contact({int? id,@required String? name, @required String? phonenumber}){
    this.id = id;
    this.name = name!;
    this.phonenumber = phonenumber!;
  }

  Contact copy({
    int? id,
    String? name,
    String? phonenumber
  }) => Contact(
      id: id?? this.id,
      name: name?? this.name,
      phonenumber: phonenumber?? this.phonenumber
  );

  static Contact fromJson(Map<String,Object?> json) => Contact(
      id: json[ContactField.id] as int?,
      name: json[ContactField.name] as String,
      phonenumber: json[ContactField.phonenumber] as String);

  Map<String,Object?> toJson() =>{
    ContactField.id:id,
    ContactField.name:name,
    ContactField.phonenumber:phonenumber
  };
}