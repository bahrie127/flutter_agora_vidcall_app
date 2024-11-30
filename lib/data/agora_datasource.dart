import 'dart:convert';

import 'package:flutter_agora_vidcall_app/data/token_model.dart';
import 'package:http/http.dart' as http;

class AgoraDatasource {
  Future<TokenModel> getToken(String channelName) async {
    final response = await http.get(
      Uri.parse('http://192.168.18.40:8000/api/agora/token?channel=$channelName'),
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final token = jsonData['token'];
      final uid = jsonData['uid'];
      return TokenModel(token: token, uid: uid);
    } else {
      throw Exception('Failed to load token');
    }
  }
}
