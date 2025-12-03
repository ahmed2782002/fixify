import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/setting_model.dart';
import 'api_constant.dart';

class ApiManager {
  static Future<Setting?> getSetting(String accountType) async {
    final url = Uri.https(ApiConstants.baseUrl, ApiConstants.settingApi, {
      "type": accountType,
    });

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.body);
        return Setting.fromJson(jsonBody);
      } else {
        print("Error status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("API ERROR: $e");
      return null;
    }
  }
}
