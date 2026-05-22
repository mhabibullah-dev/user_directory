import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/user_model.dart';

class ApiService {
  static const String _url = 'https://reqres.in/api/users?page=1&per_page=12';

  Future<List<UserModel>> fetchUsers() async {
    final apiKey = dotenv.env['API_KEY'] ?? '';
    final response = await http.get(
      Uri.parse(_url),
      headers: {'x-api-key': apiKey},
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> usersJson = data['data'];
      return usersJson.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
