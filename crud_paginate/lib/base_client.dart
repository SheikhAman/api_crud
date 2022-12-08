import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

// const global scope
const String baseUrl = 'https://reqres.in/api';

class BaseClient {
  var client = http.Client();

// GET
  Future<dynamic> get(String api) async {
    Map<String, dynamic> data;
    var url = Uri.parse(baseUrl + api);

    var response = await client.get(url);

    try {
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        // debugPrint('$data');
        return data;
      } else {
        // throw  exception and catch it in UI
      }
    } catch (e) {
      rethrow;
    }
  }

// POST Request
  Future<dynamic> post(String api, dynamic object) async {
    Map<String, dynamic> data;
    var url = Uri.parse(baseUrl + api);
    //map
    var _payload = json.encode(object);

    var response = await client.post(url, body: _payload);

    try {
      if (response.statusCode == 201) {
        data = jsonDecode(response.body);
        // debugPrint('$data');
        return data;
      } else if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        // debugPrint('$data');
        return data;
      } else {
        // throw  exception and catch it in UI
      }
    } catch (e) {
      rethrow;
    }
  }

// PUT Request
  Future<dynamic> put(String api, dynamic object) async {
    Map<String, dynamic> data;
    var url = Uri.parse(baseUrl + api);
    //map
    var _payload = json.encode(object);

    var response = await client.put(url, body: _payload);

    try {
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        // debugPrint('$data');
        return data;
      } else {
        // throw  exception and catch it in UI
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(String api) async {
    var url = Uri.parse(baseUrl + api);

    var response = await client.delete(url);

    try {
      if (response.statusCode == 204) {
        debugPrint('${response.body}');

        return response.body;
      } else {
        // throw  exception and catch it in UI
      }
    } catch (e) {
      rethrow;
    }
  }
}
