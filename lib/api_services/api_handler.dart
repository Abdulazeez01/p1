import 'dart:convert';
import 'package:front_end/api_services/api_provider.dart';
import 'package:front_end/api_services/network_exceptions.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  final ApiProvider apiProvider;

  ApiHandler({required this.apiProvider});

  Future<Map<String, dynamic>> handleRequest(
      Future<http.Response> Function() request) async {
    final response = await request();

    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw NetworkException(message: "Bad Request");
      case 401:
        throw NetworkException(message: "Unauthorized");
      case 403:
        throw NetworkException(message: "Forbidden");
      case 404:
        throw NetworkException(message: "Not Found");
      case 500:
        throw NetworkException(message: "Internal Server Error");
      default:
        throw NetworkException(message: "Unknown Error");
    }
  }

  Future<Map<String, dynamic>> get(String endpoint,
      {Map<String, String>? headers}) async {
    return await handleRequest(
        () => apiProvider.get(endpoint, headers: headers));
  }

  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data,
      {Map<String, String>? headers}) async {
    return await handleRequest(
        () => apiProvider.post(endpoint, data, headers: headers));
  }

  Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> data,
      {Map<String, String>? headers}) async {
    return await handleRequest(
        () => apiProvider.put(endpoint, data, headers: headers));
  }

  Future<Map<String, dynamic>> delete(String endpoint,
      {Map<String, String>? headers}) async {
    return await handleRequest(
        () => apiProvider.delete(endpoint, headers: headers));
  }

  Future<Map<String, dynamic>> patch(String endpoint, Map<String, dynamic> data,
      {Map<String, String>? headers}) async {
    return await handleRequest(
        () => apiProvider.patch(endpoint, data, headers: headers));
  }

  Future<Map<String, dynamic>> multipartFile(
      String endpoint, Map<String, String> fields, Map<String, String> files,
      {Map<String, String>? headers}) async {
    final response = await apiProvider.multipartFile(endpoint, fields, files,
        headers: headers);

    final httpResponse = await http.Response.fromStream(response);

    return await handleRequest(() async => httpResponse);
  }
}
