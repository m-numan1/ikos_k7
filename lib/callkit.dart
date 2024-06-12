// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_callkit_incoming/entities/entities.dart';
// import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
// import 'package:ikos_k7/callog.dart';

// import 'package:uuid/uuid.dart';

// // Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
// //   print("Handling a background message: ${message.messageId}");
// //   await Firebase.initializeApp(); //make sure firebase is initialized before using it (showCallkitIncoming)
// //   showCallkitIncoming(const Uuid().v4());
// // }
// class Callkits {
//   Future<void> showCallkitIncoming(
//       String uuid, String number, String name) async {
//     final params = CallKitParams(
//       id: uuid,
//       nameCaller: name,
//       appName: 'Callkit',
//       avatar: 'https://i.pravatar.cc/100',
//       handle: number,
//       type: 0,
//       duration: 30000,
//       textAccept: 'Accept',
//       textDecline: 'Decline',
//       missedCallNotification: const NotificationParams(
//         showNotification: true,
//         isShowCallback: true,
//         subtitle: 'Missed call',
//         callbackText: 'Call back',
//       ),
//       extra: <String, dynamic>{'userId': '1a2b3c4d'},
//       headers: <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
//       android: const AndroidParams(
//         isCustomNotification: true,
//         isShowLogo: false,
//         ringtonePath: 'system_ringtone_default',
//         backgroundColor: '#0955fa',
//         backgroundUrl: 'assets/test.png',
//         actionColor: '#4CAF50',
//         textColor: '#ffffff',
//       ),
//       ios: const IOSParams(
//         iconName: 'CallKitLogo',
//         handleType: '',
//         supportsVideo: true,
//         maximumCallGroups: 2,
//         maximumCallsPerCallGroup: 1,
//         audioSessionMode: 'default',
//         audioSessionActive: true,
//         audioSessionPreferredSampleRate: 44100.0,
//         audioSessionPreferredIOBufferDuration: 0.005,
//         supportsDTMF: true,
//         supportsHolding: true,
//         supportsGrouping: false,
//         supportsUngrouping: false,
//         ringtonePath: 'system_ringtone_default',
//       ),
//     );
//     await FlutterCallkitIncoming.showCallkitIncoming(params);
//   }

//   late Uuid _uuid;
//   String? _currentUuid;

//   Future<dynamic> getCurrentCall() async {
//     //check current call from pushkit if possible
//     var calls = await FlutterCallkitIncoming.activeCalls();

//     if (calls is List) {
//       if (calls.isNotEmpty) {
//         print('DATA: $calls');
//         _currentUuid = calls[0]['id'];
//         return calls[0];
//       } else {
//         _currentUuid = "";
//         return null;
//       }
//     }
//   }

//   void endCall() async {
//     await FlutterCallkitIncoming.endCall(_currentUuid!);
//   }
//   // Future<void> checkAndNavigationCallingPage() async {
//   //   var currentCall = await getCurrentCall();
//   //   if (currentCall != null) {
//   //     NavigationService.instance.pushNamedIfNotCurrent(AppRoute.callingPage, args: currentCall);
//   //   }
//   // }

//   // @override
//   // Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
//   //   print(state);
//   //   if (state == AppLifecycleState.resumed) {
//   //     //Check call when open app from background
//   //     checkAndNavigationCallingPage();
//   //   }
//   //}

//   void call(String number, String name) async {
//     _uuid = const Uuid();
//     _currentUuid = _uuid.v4();
//     CallKitParams params = CallKitParams(
//         id: _currentUuid,
//         nameCaller: name,
//         handle: number,
//         type: 1,
//         extra: <String, dynamic>{'userId': '1a2b3c4d'},
//         ios: IOSParams(handleType: 'generic'));
//     await FlutterCallkitIncoming.startCall(params);
//   }

//   Future<void> getDevicePushTokenVoIP() async {
//     var devicePushTokenVoIP =
//         await FlutterCallkitIncoming.getDevicePushTokenVoIP();
//     print(devicePushTokenVoIP);
//   }
// }
