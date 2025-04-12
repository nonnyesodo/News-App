import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart';
import 'package:news_app/global_widget/export.dart';

class ApiMethods {
  static Future<Response> _request(String method, String url,
      {Map<String, String>? headers, Object? body}) async {
    log("Requesting $method to $url\nBody: $body ");
    Response response = Response("", 500);

    try {
      switch (method) {
        case 'POST':
          response = await post(
            Uri.parse(url),
            headers: headers,
            body: body != null ? jsonEncode(body) : null,
          );
          break;
        case 'GET':
          response = await get(Uri.parse(url), headers: headers);
          break;
        case 'PATCH':
          response = await patch(
            Uri.parse(url),
            headers: headers,
            body: body != null ? jsonEncode(body) : null,
          );
          break;
        case 'PUT':
          response = await put(
            Uri.parse(url),
            headers: headers,
            body: body != null ? jsonEncode(body) : null,
          );
          break;
        case 'DELETE':
          response = await delete(
            Uri.parse(url),
            headers: headers,
            body: body != null ? jsonEncode(body) : null,
          );
          break;
        default:
          throw UnsupportedError("HTTP method $method not supported");
      }
      log("Response: ${response.statusCode} ${response.body}  ");
      if (response.statusCode == 401) {
        // // SessionManager().deleteToken();
        // navigatorKey.currentContext!.push(RouteName.login.path);
      }

      return response;
    } on SocketException {
      ToastMessage.showErrorToast(message: 'Check internet connection');
      rethrow;
    } on FormatException {
      ToastMessage.showErrorToast(message: 'Unable to process request');
      rethrow;
    } catch (e) {
      log('Unexpected error: $e');
      rethrow;
    }
  }

  static Future<Response> postMethod({
    Map<String, String>? headers,
    required String url,
    Object? body,
  }) {
    return _request('POST', url, headers: headers, body: body);
  }

  static Future<Response> getMethod({
    Map<String, String>? headers,
    required String url,
  }) {
    return _request('GET', url, headers: headers);
  }

  static Future<Response> patchMethod({
    Map<String, String>? headers,
    required String url,
    bool isFile = false,
    Object? body,
  }) {
    return _request('PATCH', url, headers: headers, body: body);
  }

  static Future<Response> putMethod({
    Map<String, String>? headers,
    required String url,
    Object? body,
  }) {
    return _request('PUT', url, headers: headers, body: body);
  }

  static Future<Response> deleteMethod({
    Map<String, String>? headers,
    required String url,
    Object? body,
  }) {
    return _request('DELETE', url, headers: headers, body: body);
  }
}
