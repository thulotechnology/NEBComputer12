import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:neb_computer12/ad_state.dart';
import 'package:provider/provider.dart';
import 'Model/filteredquiz.dart';
import 'Model/model.dart';
import 'homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => Quizmodel11()),
        Provider(create: (context) => Quizmodel12()),
        ChangeNotifierProvider(
          create: (context) => Filteredquiz(),
        ),
        ChangeNotifierProvider(
          create: (context) => Isselected(),
        )
      ],
      child: Provider.value(
        value: adState,
        builder: (context, child) => MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: const Color.fromRGBO(51, 153, 255, .1),
      100: const Color.fromRGBO(51, 153, 255, .2),
      200: const Color.fromRGBO(51, 153, 255, .3),
      300: const Color.fromRGBO(51, 153, 255, .4),
      400: const Color.fromRGBO(51, 153, 255, .5),
      500: const Color.fromRGBO(51, 153, 255, .6),
      600: const Color.fromRGBO(51, 153, 255, .7),
      700: const Color.fromRGBO(51, 153, 255, .8),
      800: const Color.fromRGBO(51, 153, 255, .9),
      900: const Color.fromRGBO(51, 153, 255, 1),
    };
    return MaterialApp(
      theme: ThemeData(
        // primarySwatch: MaterialColor(0xFF3F51B5, color),
        // primaryColor: Color.fromARGB(255, 0, 161, 242),
        primarySwatch: MaterialColor(0xFF00a1f2, color),
      ),
      debugShowCheckedModeBanner: false,
      title: "NEB Computer",
      home: HomePage(),
    );
  }
}

class AppInfo {
  static Color currentAppColor = Color(0xFF00a1f2);
  static Color textAppColor = Color(0xFF212529);
}
