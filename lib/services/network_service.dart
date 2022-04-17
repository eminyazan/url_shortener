import 'dart:convert';

import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

import '../models/shorten_link_model.dart';

class NetworkService {
  final String _baseUrl = "https://api.shrtco.de/v2/shorten?url=";

  Future<ApiResponse?> getShortLink(String longUrl) async {
    final result = await http.post(Uri.parse(_baseUrl), body: {"url": longUrl});

    if(jsonDecode(result.body)["ok"]!=true){
      String err=jsonDecode(result.body)["error"];
      Get.snackbar("Error!", err);
      return null;
    }else{
      final response = ApiResponse.fromJson(jsonDecode(result.body));
      return response;
    }

  }
}
