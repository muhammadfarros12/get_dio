import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ProviderServices with ChangeNotifier {
  String? id, first_name, email;

  ProviderServices({this.id, this.first_name, this.email});

  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  void getById(int id) async {
    try {
      var response = await Dio().get("https://reqres.in/api/users/$id");

      if (response.statusCode == 200) {
        _data = response.data['data'];
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
