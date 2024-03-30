import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:external_app_launcher/external_app_launcher.dart';

class UPIVerification extends StatefulWidget {
  const UPIVerification({super.key});

  @override
  State<UPIVerification> createState() => _UPIVerificationState();
}

class _UPIVerificationState extends State<UPIVerification> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Scan the UPI QR Code',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              String? cameraScanResult = await scanner.scan();
              print(cameraScanResult);
              if (cameraScanResult!.startsWith("upi://pay")) {
                print("Found Code");
                await LaunchApp.openApp(
                  androidPackageName: 'com.google.android.apps.nbu.paisa.user',
                  iosUrlScheme: 'upi://pay',
                  appStoreLink:
                      'https://apps.apple.com/app/google-pay/id376994813',
                  // openStore: false, // Uncomment this line if you want to open the app directly without checking if it's installed
                );
              } else {
                print("Not Found");
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
            ),
            child: const Text('Scan', style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
