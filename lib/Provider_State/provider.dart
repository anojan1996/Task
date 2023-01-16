import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/items.dart';

class ItemProvider with ChangeNotifier{
  List<Item> _items = [];
  final url = 'https://63c2ca0ae3abfa59bdb3329c.mockapi.io/task/api/hotel';

  List<Item> get items {
    return [..._items];
  }


  Future<void> get getItems async {
    http.Response response;
    try{
      response = await http.get(Uri.parse(url));
      List<dynamic> body = json.decode(response.body);
      _items = body.map((e) => Item(
          id: e['id'],
          name: e['Name'],
          address: e['Address'],
          booking: e['Booking'],
          photo: e['Image'],
      )
      ).toList();
    }catch(e){
      print(e);
    }

    notifyListeners();
  }
}
