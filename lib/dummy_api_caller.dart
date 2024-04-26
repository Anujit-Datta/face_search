import 'dart:convert';
import 'package:flutter/services.dart';

class DummyAPICaller{
  static Future<List<String>> fetchImages()async{
    final String response = await rootBundle.loadString("assets/images.json");
    final List<String> data=jsonDecode(response).cast<String>();
    return data;
  }
}