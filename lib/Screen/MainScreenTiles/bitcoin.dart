import 'package:flutter/material.dart';

class BitcoinAddress extends StatefulWidget {
  const BitcoinAddress({super.key});

  @override
  State<BitcoinAddress> createState() => _BitcoinAddressState();
}

class _BitcoinAddressState extends State<BitcoinAddress> {
  TextEditingController _bitcoinAddressController = TextEditingController();
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
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Bitcoin Address',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Submit'),
          ),
          Text("Report: ")
        ],
      ),
    );
  }
}
