import 'package:flutter/material.dart';
import 'package:ikos_k7/bluetoothui.dart';

class HotspotBle extends StatefulWidget {
  const HotspotBle({super.key});

  @override
  State<HotspotBle> createState() => _HotspotBleState();
}

class _HotspotBleState extends State<HotspotBle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BluetoothU());
  }
}
