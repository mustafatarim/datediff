import 'dart:convert';
import '../data/classes/diff.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class DiffModel extends ChangeNotifier {
  Future<Diff> getDiff(DateTime date1, DateTime date2) async {
    try {
      var queryParameters = {
        'd1': '${date1.toLocal()}'.split(' ')[0],
        'd2': '${date2.toLocal()}'.split(' ')[0],
      };
      var uri = Uri.https(apiURL, '/api/dd.go', queryParameters);
      var _response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });

      return Diff.fromJson(jsonDecode(_response.body));
    } catch (e) {
      print("Could Not Load Data: $e");
      return null;
    }
  }
}
