// ignore_for_file: deprecated_member_use

import 'package:get/get.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get_rx/get_rx.dart';

import 'package:permission_handler/permission_handler.dart';

class BluetoothController extends GetxController {
  RxBool conn=false.obs;
  Future scanDevices() async {
    if (await Permission.bluetoothScan.request().isGranted &&
        await Permission.bluetoothConnect.request().isGranted) {
      await FlutterBluePlus.startScan(timeout: const Duration(seconds: 20));
    }
    //await FlutterBluePlus.stopScan();
  }

  late RxList servicesss;
  List<BluetoothService> servi(BluetoothDevice device) {
    List<BluetoothService> list = device.servicesList;
    return list;
  }

  Stream<List<ScanResult>> get scanResult => FlutterBluePlus.scanResults;
  RxBool connect = false.obs;
  Future connectToDevice(BluetoothDevice device) async {
    await device.connect(timeout: Duration(seconds: 12), mtu: 512);
    device.connectionState.listen((isConnected) {
      if (isConnected == BluetoothConnectionState.connected) {
        connect.value = true;
      } else {}
    });
  }

  // turnOn() async {
  //   await FlutterBluePlus.turnOn(timeout: 30).then(
  //     (value) => Get.snackbar("Switch", "Bluetooth swtched on"),
  //   );
  // }

  Future<void> disconnect(BluetoothDevice device) async {
    device.connectionState.listen((isConnected) async {
      if (isConnected == BluetoothConnectionState.connected) {
        await device.disconnect();
        connect.value = false;
      } else {
        //Get.snackbar("Connection", device.platformName + "Try Connecting");
      }
    });
  }

  late BluetoothCharacteristic charact;
  discoverService(BluetoothDevice device) async {
    List<BluetoothService> service;
    servicesss.value = await device.discoverServices();

    servicesss.forEach((val) {
      if (val.uuid.toString() == device.servicesList.iterator.toString()) {
        val.characteristics.forEach((char) {
          if (char.characteristicUuid.toString() ==
              device.servicesList.iterator.toString()) {
            charact = char;
          }
        });
      }
    });
  }
}
