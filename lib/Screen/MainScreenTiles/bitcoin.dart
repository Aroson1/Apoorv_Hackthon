import '../../core/backend_manager.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/user_instance.dart';

class BitcoinAddress extends StatefulWidget {
  const BitcoinAddress({super.key});

  @override
  State<BitcoinAddress> createState() => _BitcoinAddressState();
}

class _BitcoinAddressState extends State<BitcoinAddress> {
  String uid = UsrInstance().getuid();
  bool isClicked = false;

  final TextEditingController _bitcoinAddressController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Enter the Bitcoin Address',
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
              controller: _bitcoinAddressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Bitcoin Address',
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
                    .CheckBitcoin(_bitcoinAddressController.text)
                    .asStream()
                : null,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const Text("Enter a Bitcoin Address");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return const Text("Error");
              }
              return Text(
                jsonDecode(snapshot.data!.body)['spam'] == true
                    ? " Address is clean."
                    : "Adress has prior association with scam(s). Unless the recipient is trusted, don't engage in any transactions.",
                style: const TextStyle(fontSize: 20),
              );
            },
          ),
        ],
      ),
    );
  }
}
