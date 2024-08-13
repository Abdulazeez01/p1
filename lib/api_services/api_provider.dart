import 'dart:convert';
import 'package:front_end/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  final String baseUrl = AppConstants.baseUrl;

  Future<http.Response> get(String endpoint,
      {Map<String, String>? headers}) async {
    return await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
    );
  }

  Future<http.Response> post(String endpoint, Map<String, dynamic> data,
      {Map<String, String>? headers}) async {
    return await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers ?? {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
  }

  Future<http.Response> put(String endpoint, Map<String, dynamic> data,
      {Map<String, String>? headers}) async {
    return await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers ?? {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
  }

  Future<http.Response> delete(String endpoint,
      {Map<String, String>? headers}) async {
    return await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
    );
  }

  Future<http.Response> patch(String endpoint, Map<String, dynamic> data,
      {Map<String, String>? headers}) async {
    return await http.patch(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers ?? {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
  }

  Future<http.StreamedResponse> multipartFile(
      String endpoint, Map<String, String> fields, Map<String, String> files,
      {Map<String, String>? headers}) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl$endpoint'));

    if (headers != null) {
      request.headers.addAll(headers);
    }

    fields.forEach((key, value) {
      request.fields[key] = value;
    });

    files.forEach((key, value) async {
      request.files.add(await http.MultipartFile.fromPath(key, value));
    });

    return await request.send();
  }
}
