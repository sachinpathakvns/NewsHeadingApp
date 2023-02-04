import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:http/http.dart' as https;
import 'package:flutter/material.dart';
import 'Model.dart';


class ApiDemo {

  Future<List<NewsLetter>?> getNews()async{
    var client = https.Client();
    var uri = Uri.parse('https://api.sampleapis.com/futurama/characters');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return newsLetterFromJson(json);
    }
  }
}
