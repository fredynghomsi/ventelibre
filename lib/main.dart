import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ventelibre/ecrans/wrapper.dart';
import 'package:ventelibre/model/articleModel.dart';
import 'package:ventelibre/services/authentification.dart';
import 'package:ventelibre/services/dbServices.dart';

import 'home/profile/profile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      StreamProvider.value(value: AuthService().user, initialData: null),
      StreamProvider<List<Article>>.value(
        initialData: [],
        value: DatabaseService().articles,
      ),
    ],
    child: MyApp(),
  )
      //const MyApp()
      );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.amber,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          appBarTheme: AppBarTheme(backgroundColor: Colors.white)),
      //home: Wrapper(),
      initialRoute: '/',
      routes: {
        '/': (context) => Wrapper(),
        '/profile': (context) => Profile(),
      },
    );
  }
}
