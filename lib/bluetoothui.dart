import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:ikos_k7/bluetooth.dart';
import 'package:ikos_k7/screen.dart';

class BluetoothU extends StatelessWidget {
  const BluetoothU({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        ElevatedButton(
            onPressed: () {
              //Get.to(() => Screen());
            },
            child: Text("Turn On Ble"))
      ]),
      body: GetBuilder<BluetoothController>(
          init: BluetoothController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        controller.scanDevices();
                      },
                      child: const Text("Scan")),
                  const SizedBox(
                    height: 30,
                  ),
                  StreamBuilder<List<ScanResult>>(
                      stream: controller.scanResult,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                controller.conn.value =
                                    snapshot.data![index].device.isConnected;
                                final data = snapshot.data!;
                                print(snapshot.data![index].device);
                                return Card(
                                  child: ListTile(
                                    onLongPress: () => Get.to(() => Screen(
                                          device: data[index].device,
                                        )),
                                    onTap: () => controller.conn.value == true
                                        ? controller
                                            .disconnect(data[index].device)
                                        : controller.connectToDevice(
                                            snapshot.data![index].device),
                                    title: Text(snapshot
                                        .data![index].device.platformName),
                                    subtitle: Text(snapshot
                                        .data![index].device.remoteId
                                        .toString()),
                                    trailing: controller.conn.value == true
                                        ? Text("Connected")
                                        : Text("Try Connect "),
                                  ),
                                );
                              });
                        } else {
                          return const Text("No device");
                        }
                      })
                ],
              ),
            );
          }),
    );
  }
}
