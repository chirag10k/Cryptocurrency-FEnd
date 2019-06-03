import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'home_page.dart';

void main() async{
  final List currencies = await getCurrencies();
  print(currencies);
  runApp(new MyApp(currencies));
}

class MyApp extends StatelessWidget{
  final List _currencies;
  MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[100] :null
      ),
      home: new HomePage(_currencies),
    );
  }
}


Future<List> getCurrencies() async{
  String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
  //var response;
  http.Response response = await http.get(cryptoUrl);
  return jsonDecode(response.body);
}