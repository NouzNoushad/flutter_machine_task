import 'package:http/http.dart' as http;

class BaseClient {
  static var baseClient = http.Client();
  static var baseHeader = {'content-type': 'application/json'};

  static Future<dynamic> get(String endpoint,
      [Map<String, String>? header]) async {
    try {
      var uri = Uri.parse(endpoint);
      var response = await baseClient.get(uri, headers: header ?? baseHeader);
      if (response.statusCode == 200 ) {
        return response.body;
      } else {
        print('error');
      }
    } catch (err) {
      print(err);
    }
  }
}
