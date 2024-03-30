import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermissions() async {
  var statusSms = await Permission.sms.status;
  var statusCamera = await Permission.camera.status;
  var statusCallLog = await Permission.phone.status;

  if (statusSms.isDenied) {
    await Permission.sms.request();
  }
  var status = await Permission.sms.status;
  if (!status.isGranted) {
    status = await Permission.sms.request();
  }

  if (statusCamera.isDenied) {
    await Permission.camera.request();
  }

  if (statusCallLog.isDenied) {
    await Permission.phone.request();
  }
}
