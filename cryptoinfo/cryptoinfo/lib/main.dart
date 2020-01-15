import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:cryptoinfo/home_page.dart';

void main() async { 
  List currencies = await getCurrencies();
  print(currencies);
  runApp(new MyApp(currencies));
  }

class MyApp extends StatelessWidget {
  final List _currencies;
  MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData( primarySwatch: Colors.pink),
      home: new HomePage(_currencies),
      
    );
  }
}

 Future<List> getCurrencies() async{
    String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/";
    http.Response response = await http.get(cryptoUrl);
    return json.decode(response.body);
  }

