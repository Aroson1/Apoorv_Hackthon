import 'dart:convert';

import 'package:flutter/material.dart';

import '../../core/backend_manager.dart';
import '../../core/user_instance.dart';

class URLVerification extends StatefulWidget {
  const URLVerification({super.key});

  @override
  State<URLVerification> createState() => _URLVerificationState();
}

class _URLVerificationState extends State<URLVerification> {
  String uid = UsrInstance().getuid();
  bool isClicked = false;

  final TextEditingController _urlAddressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Enter the URL Address',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: TextField(
              controller: _urlAddressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'URL Address',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isClicked = true;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
            ),
            child: const Text('Submit', style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Report: ", style: TextStyle(fontSize: 25)),
          StreamBuilder(
            stream: isClicked
                ? BackendManager(uid: uid)
                    .CheckURL(_urlAddressController.text)
                    .asStream()
                : null,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const Text("Enter a URL Address");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return const Text("Error");
              }

              return Text(
                jsonDecode(snapshot.data!.body)['spam'] == true
                    ? "This URL is safe."
                    : "This URL is not safe. Unless you know what you are doing, it is recommended to not visit this URL.",
                style: const TextStyle(fontSize: 20),
              );
            },
          ),
        ],
      ),
    );
  }
}
