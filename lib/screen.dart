import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:ikos_k7/bluetooth.dart';

class Screen extends StatefulWidget {
  BluetoothDevice device;
  Screen({super.key, required this.device});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                BluetoothController().discoverService(widget.device);
              },
              child: Text("Service")),
          GetBuilder<BluetoothController>(
            init: BluetoothController(),
            builder: (controller) => StreamBuilder<List<BluetoothService>>(
              stream: controller.discoverService(widget.device),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: controller.servicesss.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data!;
                    List list = data[index].includedServices;
                    if (snapshot.hasData) {
                      return ListTile(
                        title: Text(list[index]),
                      );
                    } else {
                      return Text("Nothing to show");
                    }
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
