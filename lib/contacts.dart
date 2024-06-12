
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:ikos_k7/callog.dart';

class FlutterContact extends StatefulWidget {
  const FlutterContact({super.key});

  @override
  _FlutterContactState createState() => _FlutterContactState();
}

class _FlutterContactState extends State<FlutterContact> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future addcontac(String name, List<Phone> number) async {
    Contact? contact;
    contact!.phones = number;
    contact.displayName = name;
    await FlutterContacts.insertContact(contact);
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission()) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts(withProperties: true);
      setState(() => _contacts = contacts);
    }
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: Text('Contacts')), body: _body());

  Widget _body() {
    if (_permissionDenied) return Center(child: Text('Permission denied'));
    if (_contacts == null) return Center(child: CircularProgressIndicator());
    return ListView.builder(
        itemCount: _contacts!.length,
        itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: ListTile(
                    title: Text(_contacts![i].displayName),
                    subtitle: Text(_contacts![i].phones.first.number),
                    onTap: () async {
                      String number = _contacts![i].phones.first.number;
                      callNumber(number);

                      // final fullContact =
                      //     await FlutterContacts.getContact(_contacts![i].id);
                      // await Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (_) => ContactPage(fullContact!)));
                    }),
              ),
            ));
  }
}

class ContactPage extends StatelessWidget {
  final Contact contact;
  ContactPage(this.contact);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(contact.displayName)),
      body: Column(children: [
        Text('First name: ${contact.name.first}'),
        Text('Last name: ${contact.name.last}'),
        Text(
            'Phone number: ${contact.phones.isNotEmpty ? contact.phones.first.number : '(none)'}'),
        Text(
            'Email address: ${contact.emails.isNotEmpty ? contact.emails.first.address : '(none)'}'),
      ]));
}
 callNumber(String  number) async{
 //set the number here
 
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}
