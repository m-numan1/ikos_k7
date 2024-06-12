// import 'package:call_log/call_log.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
// import 'package:intl/intl.dart';
// // ignore: depend_on_referenced_packages
// //import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';

// class CallLogs {
//   getAvator(CallType callType) {
//     switch (callType) {
//       case CallType.outgoing:
//         return CircleAvatar(
//           maxRadius: 30,
//           foregroundColor: Colors.green,
//           backgroundColor: Colors.greenAccent,
//           child: Icon(
//             Icons.phone,
//             color: Colors.green,
//           ),
//         );
//       case CallType.missed:
//         return CircleAvatar(
//             maxRadius: 30,
//             foregroundColor: Colors.red[400],
//             backgroundColor: Colors.red[400],
//             child: Icon(
//               Icons.phone,
//               color: Colors.red,
//             ));
//       default:
//         return CircleAvatar(
//             maxRadius: 30,
//             foregroundColor: Colors.indigo[700],
//             backgroundColor: Colors.indigo[700],
//             child: Icon(
//               Icons.phone,
//               color: Colors.blue,
//             ));
//     }
//   }

//   Future<Iterable<CallLogEntry>> getCallLogs() {
//     return CallLog.get();
//   }

//   String formatDate(DateTime dt) {
//     return DateFormat('d-MMM-y H:m:s').format(dt);
//   }

//   getTitle(CallLogEntry entry) {
//     if (entry.name == null) {
//       return Text(entry.number ?? " ");
//     }

//     if (entry.name!.isEmpty) {
//       return Text(entry.number ?? "");
//     } else {
//       return Text(entry.name ?? "");
//     }
//   }

//   String getTime(int duration) {
//     Duration d1 = Duration(seconds: duration);
//     String formatedDuration = "";
//     if (d1.inHours > 0) {
//       formatedDuration += d1.inHours.toString() + "h ";
//     }
//     if (d1.inMinutes > 0) {
//       formatedDuration += d1.inMinutes.toString() + "m ";
//     }
//     if (d1.inSeconds > 0) {
//       formatedDuration += d1.inSeconds.toString() + "s";
//     }
//     if (formatedDuration.isEmpty) return "0s";
//     return formatedDuration;
//   }

//   callNumber(String  number) async{
//  //set the number here
 
//   bool? res = await FlutterPhoneDirectCaller.callNumber(number);
// }
// }
