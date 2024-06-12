import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_dialpad/flutter_dialpad.dart';
// ignore: depend_on_referenced_packages
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
// ignore: depend_on_referenced_packages
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:ikos_k7/bluetoothui.dart';
import 'package:ikos_k7/contacts.dart';
import 'package:ikos_k7/dialpad.dart';
import 'package:ikos_k7/phonelist.dart';
import 'package:ikos_k7/sms.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' IKOS K7',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey[50]!),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int indx = 0;
  final List<Widget> _pages = [
    const Dialpads(),
    //PhonelogsScreen(),
    FlutterContact(),
    Message(),
    BluetoothU()
    // Hotspot(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        index: indx,
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        color: Colors.grey,
        items: const [
          CurvedNavigationBarItem(
            child: Icon(
              Icons.dialpad_sharp,
              color: Colors.white,
            ),
            label: 'Dialpad',
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.call,
              color: Colors.white,
            ),
            label: 'CallLog',
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.chat_bubble_outline,
              color: Colors.white,
            ),
            label: 'Chat',
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.wifi,
              color: Colors.white,
            ),
            label: 'bluetooth',
          ),
        ],
        onTap: (index) {
          // Handle button tap
          setState(() {
            indx = index;
          });
        },
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: IndexedStack(
        index: indx,
        children: _pages,
      ),
    );
  }
}
