import 'package:flutter/material.dart';

class User{
  String email,password,name;

  User(email,password,name);
  Map<String,dynamic> ConvertToMap(){
    return {
      'email':this.email,
      'password':this.password,
      'name':this.name,
    };
  }

  User fromMap(Map<String, dynamic> mymap) {
    return new User(mymap['email'], mymap['password'], mymap['name']);
  }


}
