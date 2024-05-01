import 'package:flutter/material.dart';
import 'package:legitcheck/view_models/view_Model_Profile.dart';
import 'package:legitcheck/view_models/view_Model_ResultQR.dart';
// import 'package:legitcheck/view_models/view_Model_Splash_Screen.dart';
import 'package:provider/provider.dart';
import 'package:legitcheck/views/splash_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: ViewModelSplash().getDataUser(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       return MultiProvider(
    //           providers: [
    //             ChangeNotifierProvider(create: (_) => ViewModelSplash()),
    //           ],
    //           child: MaterialApp(
    //             debugShowCheckedModeBanner: false,
    //             home: SplashScreen(),
    //           ));
    //     } else {
    //       return CircularProgressIndicator();
    //     }
    //   },
    // );
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ViewModelProfile()),
          ChangeNotifierProvider(create: (_) => ViewModelResultQR()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: SplashScreen(),
        ));
  }
}
