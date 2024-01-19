import 'dart:convert';

import 'package:hoscard_ui/dto/serviceDto.dart';
import 'package:http/http.dart' as http;

import '../configuration/config.dart';

class ServiceHandler {
  Future<List<ServiceDto>> fetchUserServices(String jwtToken) async {
    final response = await http.get(Uri.parse("http://${Config.backendAddress}:${Config.backendPort}/services"),
        headers: <String, String>{
          "Authorization": "Bearer: $jwtToken",
        });

    if (response.statusCode == 200) {
      final List<dynamic> services = jsonDecode(response.body);
      final List<ServiceDto> servicesList = services
          .map((e) => ServiceDto.fromJson(e as Map<String, dynamic>))
          .toList();
      return servicesList;
    } else {
      return List.empty();
    }
  }
}
