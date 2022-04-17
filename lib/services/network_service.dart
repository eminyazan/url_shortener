import 'package:http/http.dart';
import 'package:http/http.dart'as http;
import 'package:url_shortener/models/shorten_link_model.dart';

class NetworkService{
  final String _baseUrl = "https://api.shrtco.de/v2/shorten?url=";

  Future<ApiResponse?> getShortLink(String longUrl) async {
    final Response result = await http.post(Uri.parse(_baseUrl), body: {"url" : longUrl});

    if(result.statusCode == 200){
      print("Succesfully Completed");

      final response = ApiResponse.fromJson(result.headers);

      return response;
    }else{
      print("Error in Api");
      print(result.body);
      return null;
    }
  }

}