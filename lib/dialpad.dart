import 'package:flutter/material.dart';
import 'package:flutter_dialpad/flutter_dialpad.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Dialpads extends StatefulWidget {
  const Dialpads({super.key});

  @override
  State<Dialpads> createState() => _DialpadsState();
}

class _DialpadsState extends State<Dialpads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DialPad(
                enableDtmf: true,
                outputMask: "000 000-00000",
                backspaceButtonIconColor: Colors.red,
                makeCall: (number) {
                  callNumber(number);
                  print(number);
                }),
          ],
        ),
      ),
    );
  }
}

callNumber(String number) async {
  //set the number here

  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}
