import 'package:http/http.dart' as https;
import 'dart:convert';

// import 'package:http/http.dart';

class NetworkHelper {
  NetworkHelper({this.url});

  final Uri url;

  Future getData() async {
    https.Response response = await https.get(url);
    if (response.statusCode == 200) {
      print("API call OK");
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('API ERROR: ' + response.statusCode.toString());
    }
  }
}
