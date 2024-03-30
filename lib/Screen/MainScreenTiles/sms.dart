import 'package:apoorv_hackathon/core/backend_manager.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../core/user_instance.dart';

class SMSList extends StatefulWidget {
  const SMSList({super.key});

  @override
  State<SMSList> createState() => _SMSListState();
}

class _SMSListState extends State<SMSList> {
  List<SmsMessage> messages = [];
  List<bool> isSpamList = [];
  bool isLoading = true;
  bool hasPermission = false;
  String uid = UsrInstance().getuid();

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    PermissionStatus permissionStatus = await _getPermission();
    if (permissionStatus == PermissionStatus.granted) {
      setState(() {
        hasPermission = true;
      });
      getMessages();
    } else {
      setState(() {
        isLoading = false;
      });
      // Show an error message or request permission again
    }
  }

  Future<PermissionStatus> _getPermission() async {
    PermissionStatus permission = await Permission.sms.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.sms.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  // get the SMS messages using a function
  void getMessages() async {
    try {
      SmsQuery query = SmsQuery();
      List<SmsMessage> sms = await query.getAllSms;
      setState(() {
        messages = sms;
        isSpamList = List.generate(sms.length, (index) => true);
        isSpamList[0] = false;
        isLoading = false;
      });
      print(messages.length);
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Show an error message or handle the exception
    }
  }

  // function to toggle isSpam for a message
  void toggleSpam(int index) {
    setState(() {
      isSpamList[index] = !isSpamList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (!hasPermission) {
      return const Center(
        child: Text('Permission denied to read SMS messages'),
      );
    } else {
      print("lenght: ${messages.length}");
      return Column(
        children: [
          Text(
            'SMS Messages',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(
            height: 20,
          ),
          for (int i = 0; i < messages.length; i++)
            GlassContainer(
              opacity: 0.3,
              shadowStrength: 8,
              borderRadius: BorderRadius.circular(12),
              color: isSpamList[i] ? Colors.red : Colors.green,
              // margin: const EdgeInsets.all(8),
              // padding: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(messages[i].address!),
                subtitle: Text(messages[i].body!),
                trailing: IconButton(
                  icon: Icon(
                      isSpamList[i] ? Icons.flag_rounded : Icons.flag_outlined,
                      color: isSpamList[i] ? Colors.green : Colors.red),
                  onPressed: () {
                    toggleSpam(i);
                    BackendManager(uid: uid).FlagPhoneNo(messages[i].address!);
                  },
                ),
              ),
            ),
        ],
      );
    }
  }
}
