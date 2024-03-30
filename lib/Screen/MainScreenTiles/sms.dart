import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';

class SMSList extends StatefulWidget {
  const SMSList({super.key});

  @override
  State<SMSList> createState() => _SMSListState();
}

class _SMSListState extends State<SMSList> {
  List<SmsMessage> messages = [];
  // get the SMS messages using a function
  void getMessages() async {
    SmsQuery query = SmsQuery();
    List<SmsMessage> sms = await query.getAllSms;
    setState(() {
      messages = sms;
    });
    print(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    // If sms is empty display a loading indicator and get the messages, once sms are loaded display the messages in glassmorphic list tiles
    if (messages.isEmpty) {
      getMessages();
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GlassContainer(
              height: 100,
              width: 300,
              blur: 10,
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1.0,
              ),
              color: const Color.fromRGBO(216, 121, 223, 0.1),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: ListTile(
                title: Text(messages[index].address!),
                subtitle: Text(messages[index].body!),
              ),
            ),
          );
        },
      );
    }
  }
}
