import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class PhoneTextField extends StatefulWidget {
  late Function update;

  @override
  _PhoneTextFieldState createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  TextEditingController t1 = TextEditingController();

  bool empty = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.update = (text) {
      print('called: ' + text);

      setState(() {
        t1.text = text;
      });
    };

    t1.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
      controller: t1,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
          labelText: "Phone number",
          contentPadding: EdgeInsets.all(10),
          suffixIcon: t1.text.length > 0
              ? IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: () {
                    callNumber(t1.text);
                  })
              : null),
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      onSubmitted: (value) => callNumber( t1.text),
    ));
  }
}
 callNumber(String  number) async{
 //set the number here
 
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}