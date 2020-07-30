import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({this.url});

  final String url;

  Future<Map<String, dynamic>> getData() async {
    http.Response response = await http.get(url);
    return response.statusCode == 200
        ? jsonDecode(response.body)
        : {'error': response.statusCode};
  }
}
