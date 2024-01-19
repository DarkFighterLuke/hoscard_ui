import 'dart:convert';

import 'package:hoscard_ui/dto/userDto.dart';
import 'package:http/http.dart' as http;

import '../configuration/config.dart';

class UserHandler {
  Future<UserDto> fetchUserDetails(String jwtToken) async {
    final response = await http.get(Uri.parse("http://${Config.backendAddress}:${Config.backendPort}/users"),
        headers: <String, String>{
          "Authorization": "Bearer: $jwtToken",
        });

    if (response.statusCode == 200) {
      final UserDto user = UserDto.fromJson(jsonDecode(response.body));
      return user;
    } else {
      return UserDto(userId: -1, username: "");
    }
  }
}