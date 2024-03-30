import 'dart:convert';

import 'package:http/http.dart' as http;

class BackendManager {
  final String uid;
  BackendManager({required this.uid});

  final String baseURL = "http://10.0.2.2:5000";

  Uri endpoint(String path) {
    print(Uri.parse(baseURL + path));
    return Uri.parse(baseURL + path);
  }

  Future<http.Response> Login(String email) async {
    try {
      final response = await http.post(
        endpoint("/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          {
            "email": email,
          },
        ),
      );
      return response;
    } catch (e) {
      // Handle error
      // make a custom response with the error
      http.Response errorResponse = http.Response("hello", 200);
      return errorResponse;
    }
  }

  Future<http.Response> SignUp(String email) async {
    try {
      final response = await http.post(
        endpoint("/signup"),
        body: {
          "email": email,
        },
      );
      return response;
    } catch (e) {
      // Handle error
      // make a custom response with the error
      http.Response errorResponse = http.Response("error", 500);
      return errorResponse;
    }
  }

  Future<http.Response> CheckSMS(String phoneNo, String sms) async {
    try {
      final response = await http.post(
        endpoint("/check_sms"),
        body: {
          "uid": uid,
          "sms": sms,
        },
      );
      return response;
    } catch (e) {
      // Handle error
      // make a custom response with the error
      http.Response errorResponse = http.Response("error", 500);
      return errorResponse;
    }
  }

  Future<http.Response> CheckPhoneNo(String phoneNo) async {
    try {
      final response = await http.post(
        endpoint("/check_phone"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "uid": uid,
          "phone_no": phoneNo,
        }),
      );
      return response;
    } catch (e) {
      return http.Response("error", 500);
      // Handle error
    }
  }

  Future<http.Response> CheckURL(String url) async {
    try {
      final response = await http.post(endpoint("/check_url"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "uid": uid,
            "url": url,
          }));
      return response;
    } catch (e) {
      return http.Response("error", 500);
      // Handle error
    }
  }

  Future<http.Response> CheckBitcoin(String address) async {
    try {
      final response = await http.post(endpoint("/check_bitcoin"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            {
              "uid": uid,
              "address": address,
            },
          ));
      print(response.body);

      return response;
    } catch (e) {
      print(e);

      http.Response errorResponse = http.Response("error", 500);
      return errorResponse;
    }
  }

  Future<void> FlagPhoneNo(String phoneNo) async {
    try {
      await http.post(
        endpoint("/flag_phone"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "uid": uid,
          "phone_no": phoneNo,
        }),
      );
    } catch (e) {
      // Handle error
    }
  }
}
