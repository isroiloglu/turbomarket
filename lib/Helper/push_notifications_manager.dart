import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/arguments_map.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/dialogHelper.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/globalData.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/storageHelper.dart';
import '../Constants/appStringConstants.dart';
import '../Constants/routeConstant.dart';
import '../main.dart';
import 'package:permission_handler/permission_handler.dart';


class PushNotificationsManager {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  static final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  static const initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  static const initializationSettingsIOS = IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  final InitializationSettings initializationSettings =
      const InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS);

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void setUpFirebase(BuildContext context) {
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      if (payload?.isNotEmpty ?? false) {
        Map notificationModelMap = json.decode(payload.toString());
        if (notificationModelMap['type'] == "P") {
          Navigator.pushNamed(context, productDetailPage,
              arguments: getProductDataMap(notificationModelMap['title'] ?? '',
                  notificationModelMap['id'].toString() ?? ""));
        } else if (notificationModelMap['type'] == "C") {
          Navigator.of(context).pushNamed(catalogPage,
              arguments: getCatalogMap(notificationModelMap['type_data'], "",
                  notificationModelMap['title'], false));
        } else if (notificationModelMap['type'] == "O") {
          //Navigator.pushNamed(context, notifi);
        } else {
         // Navigator.pushNamed(context, notificationPage);
        }
      }
    });
    _firebaseCloudMessagingListeners(context);
  }

  Future<StyleInformation?> getNotificationStyle(String? image) async {
    if (image != null && image.isNotEmpty) {
      final ByteData imageData =
          await NetworkAssetBundle(Uri.parse(image)).load("");
      return BigPictureStyleInformation(
          ByteArrayAndroidBitmap(imageData.buffer.asUint8List()));
    } else {
      return null;
    }
  }

  void showNotification(
      String title, String body, String? payload, String? image) async {
    var notificationStyle = await getNotificationStyle(image);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        '${Random().nextDouble()}', 'CS-CART Notification',
        importance: Importance.max,
        priority: Priority.max,
        playSound: true,
        styleInformation: notificationStyle);

    var iOSPlatformChannelSpecifics = const IOSNotificationDetails(
      presentAlert: true,
      presentSound: true,
      presentBadge: true,
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    flutterLocalNotificationsPlugin
        .show(0, title, body, platformChannelSpecifics, payload: payload);
  }

  Future<String?> createFcmToken() async {
    return _firebaseMessaging.getToken();
  }

  void _firebaseCloudMessagingListeners(BuildContext context) async {

     if (Platform.isIOS) {
      _iosPermission();
    }
     else if (Platform.isAndroid) {
       String version = await deviceInfo.androidInfo.then((value) =>value.version.release ?? '10' );
       if((int.parse(version) > 12)) {
         NotificationSettings settings = await _firebaseMessaging
             .requestPermission(
           alert: true,
           announcement: false,
           badge: true,
           carPlay: false,
           criticalAlert: false,
           provisional: false,
           sound: true,
         );


         if (settings.authorizationStatus == AuthorizationStatus.authorized) {
           print('User granted permission');
         } else
         if (settings.authorizationStatus == AuthorizationStatus.provisional) {
           print('User granted provisional permission');
         } else
         if ((settings.authorizationStatus == AuthorizationStatus.denied)) {
           if (GlobalData.isFirstTime) {
             DialogHelper.notificationPermissionDialog(
                 GenericMethods.getStringValue(
                     context, AppStringConstant.notificationMessage), context,
                 onConfirm: () async {
                   await openAppSettings();
                 });
             GlobalData.isFirstTime = false;
           }
           print('User declined or has not accepted permission');
         }
       }
     }

    var fcmToken = await createFcmToken();
     print('======> ${fcmToken.toString()}');
    if (fcmToken != null) {
      storageController.setFirebaseToken(fcmToken.toString());
    }

    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      print("deviceId${iosInfo.identifierForVendor}");
    } else {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print("deviceId${androidInfo.androidId}");
    }

    _firebaseMessaging.subscribeToTopic("CS-Cart-MV");

    //When app is in Working state
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        RemoteNotification? notification = message.notification;
        print('on message ${message.data}');
        print("onMessageNotification${message.notification?.body}");
        String? title = notification?.title;
        String? body = notification?.body;
        String? imageUrl = "";
        if (Platform.isAndroid) {
          imageUrl = message.notification?.android?.imageUrl;
        } else {
          imageUrl = message.notification?.apple?.imageUrl;
        }
        showNotification(title!, body!, json.encode(message.data),
            message.data["attachment"] ?? "");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data['type'] == "P") {
        Navigator.pushNamed(context, productDetailPage,
            arguments: getProductDataMap(message.data['title'] ?? '',
                message.data['id'].toString() ?? ""));
      } else if (message.data['type'] == "C") {
        Navigator.of(context).pushNamed(catalogPage,
            arguments: getCatalogMap(message.data['type_data'] ?? "", "",
                message.data['title'] ?? "", false));
      } else if (message.data['type'] == "O") {
        Navigator.pushNamed(context, home);

      } else {
        Navigator.pushNamed(context, home);

      }
    });
  }

  void checkInitialMessage(BuildContext context) {
    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      print("open app data");
      print(message?.data);
      if (message?.data != null) {
        if (message?.data['type'] == "P") {
          Navigator.pushNamed(context, productDetailPage,
              arguments: getProductDataMap(message?.data['title'] ?? '',
                  message?.data['id'].toString() ?? ""));
        } else if (message?.data['type'] == "C") {
          Navigator.of(context).pushNamed(catalogPage,
              arguments: getCatalogMap(message?.data['type_data'] ?? "", "",
                  message?.data['title'], false));
        } else if (message?.data['type'] == "O") {
          Navigator.pushNamed(context, home);
        } else {
          Navigator.pushNamed(context, home);
        }
      }
    });
  }

   _iosPermission() async {
  await  _firebaseMessaging
        .requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    )
        .then((value) {
      print("Settings registered: ${value.authorizationStatus}");
    });
  }
}
