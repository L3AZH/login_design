import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:login_design/db/DbHelper.dart';
import 'package:login_design/db/model/ContactModel.dart';

class ProviderModel with ChangeNotifier{
    /**
     * Login Screen
     */
    String _username="";
    String _password="";
    String getUsername() => _username;
    setUsername(String name){
        _username = name;
        notifyListeners();
    }
    String getPassword() => _password;
    setPassword(String pass){
        _password = pass;
        notifyListeners();
    }

    void hashPassword(){
        String result = "";
        for(int i=0;i<_password.length;i++){
            result=result+_password.codeUnitAt(i).toString();

        }
        _password = result;
        notifyListeners();
    }
    /**
     * Home Screen
     */
    int _currentSelectedItem=0;
    int getCurrentItem() => _currentSelectedItem;
    setCurrentItem(int index){
        _currentSelectedItem = index;
        notifyListeners();
    }
    List<Contact> listContact = [];
    initList()async{
        listContact = await ContactsDatabase.instance.getListContacts();
        notifyListeners();
    }
    List<Contact> getListContact()=> listContact;

}