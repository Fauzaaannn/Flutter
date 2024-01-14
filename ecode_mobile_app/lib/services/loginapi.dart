import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse('https://dummyjson.com/auth/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return {'success': true, 'data': jsonDecode(response.body)};
      } else {
        return {'success': false, 'error': 'Login failed with status code: ${response.statusCode}'};
      }
    } catch (error) {
      return {'success': false, 'error': 'Error during login: $error'};
    }
  }
}
