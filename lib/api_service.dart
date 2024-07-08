import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://b7a5-2401-4900-1ce2-d1d8-70f5-92cd-6b16-c6eb.ngrok-free.app/api';

  static Future<List<dynamic>> fetchOrders() async {
    final response = await http.get(Uri.parse('$baseUrl/orders'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch orders');
    }
  }
}
