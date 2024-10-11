import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';

import 'Config/theme.dart';
import 'Constants/appConstants.dart';
import 'Constants/appNavigations.dart';
import 'CustomWidgets/appRestart.dart';
import 'Helper/appLocalization.dart';
import 'Helper/globalData.dart';
import 'Helper/storageHelper.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HttpOverrides.global = MyHttpOverrides();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await GetStorage().initStorage;
  await storageController.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  // SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(statusBarColor: Colors.white));
  runZonedGuarded(() async {
    // await NotificationsService().init();
    runApp(const MyApp());
  }, (error, stack) {
    print('main error - $error');
    print('main stack - $stack');
  }, zoneSpecification: const ZoneSpecification());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale? locale;
  late FirebaseMessaging _messaging;

  @override
  void initState() {
    super.initState();
    _messaging = FirebaseMessaging.instance;
    locale = Locale(storageController.getCurrentLanguage());
    bool? isDarkMode = storageController.getThemeMode() ?? false;
    setState(() {
      if (isDarkMode == true) {
        MyApp.themeNotifier.value = ThemeMode.dark;
      } else {
        MyApp.themeNotifier.value = ThemeMode.light;
      }
    });
    getToken();
    print("token------->${getToken()}");
    GlobalData.isFirstTime = true;
  }

  Future<String?> getToken() async {
    var firebaseToken = await _messaging.getToken();
    print(firebaseToken);
    return firebaseToken;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: MyApp.themeNotifier,
        builder: (BuildContext context, ThemeMode currentMode, __) {
          return AppRestart(
            child: MaterialApp(
              title: AppStringConstant.appName,
              themeMode: currentMode,

              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              navigatorKey: navigatorKey,
              // home: const SplashScreenView(),
              initialRoute: splash,
              onGenerateRoute: generateRouteSettings,
              debugShowCheckedModeBanner: false,
              supportedLocales:
                  AppConstant.supportedLanguages.map((e) => Locale(e)),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              locale: locale,
            ),
          );
        });
  }

  void setLocale(String localeValue, BuildContext context) {
    setState(() {
      storageController.setCurrentLanguage(localeValue);
      AppLocalizations.delegate.load(Locale(localeValue));
      locale = Locale(localeValue);
    });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
