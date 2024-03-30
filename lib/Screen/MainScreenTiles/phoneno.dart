import 'dart:convert';

import 'package:flutter/material.dart';

import '../../core/backend_manager.dart';
import '../../core/user_instance.dart';

class PhoneNoVerification extends StatefulWidget {
  const PhoneNoVerification({super.key});

  @override
  State<PhoneNoVerification> createState() => _PhoneNoVerificationState();
}

class _PhoneNoVerificationState extends State<PhoneNoVerification> {
  String uid = UsrInstance().getuid();
  bool isClicked = false;

  final TextEditingController _phonenoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Enter the Phone Number',
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
              controller: _phonenoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone Number',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Flag number as spam?'),
              TextButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 138, 9, 0),
                ),
                onPressed: () {
                  BackendManager(uid: uid).FlagPhoneNo(_phonenoController.text);
                },
                child: Text('Flag'),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          const Text("Report: ", style: TextStyle(fontSize: 25)),
          StreamBuilder(
            stream: isClicked
                ? BackendManager(uid: uid)
                    .CheckPhoneNo(_phonenoController.text)
                    .asStream()
                : null,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const Text("Enter a Phone Number");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return const Text("Error");
              }
              //TODO: Add the response from the backend
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i in jsonDecode(snapshot.data!.body).entries)
                    Text(
                      i.key + " : " + i.value.toString(),
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 20),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
