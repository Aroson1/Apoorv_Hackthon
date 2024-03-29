import 'package:http/http.dart' as http;

class BackendManager {
  final String uid;
  BackendManager({required this.uid});

  final String baseURL = "http://10.0.2.2:3000";

  Uri endpoint(String path) {
    return Uri.parse(baseURL + path);
  }

  Future<http.Response> CheckSMS(String phoneNo, String sms) async {
    final response = await http.post(
      endpoint("/check_sms"),
      body: {
        "uid": uid,
        "sms": sms,
      },
    );
    return response;
  }

  Future<http.Response> CheckPhoneNo(String phoneNo) async {
    final response = await http.post(
      endpoint("/check_phone"),
      body: {
        "uid": uid,
        "phone_no": phoneNo,
      },
    );
    return response;
  }

  Future<http.Response> CheckURL(String url) async {
    final response = await http.post(
      endpoint("/check_url"),
      body: {
        "uid": uid,
        "url": url,
      },
    );
    return response;
  }

  Future<http.Response> CheckBitcoin(String address) async {
    final response = await http.post(
      endpoint("/check_bitcoin"),
      body: {
        "uid": uid,
        "address": address,
      },
    );
    return response;
  }
}
