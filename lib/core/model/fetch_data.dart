import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'data.dart';

class Fetch extends ChangeNotifier{


Future<void> addAccount(
      email, password,username) async {
    const url = 'https://walid-bf469-default-rtdb.firebaseio.com/accounts.json';

    try {
      http.post(
        Uri.parse(url),
        body: json.encode({
          'email': email,
          'password': password,
          'username': username,

        }),
      );
    } catch (error) {
      
    }
  }

  ///
  List<Data> data=[];
  Future<void> fetchAccount() async {
    const url = 'https://walid-bf469-default-rtdb.firebaseio.com/accounts.json';
    //accountNow.clear();
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((bagId, walid) {
        data.add(Data(
          email: walid['email'],
          password: walid['password'],
          username: walid['username'],
         
        ));
      }); 
            print("222222");

            print("22222222222222222222222222222222222222222222");

            print("222222");

    }catch(e){

    }}
}