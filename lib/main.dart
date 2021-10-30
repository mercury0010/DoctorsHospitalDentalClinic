import 'dart:html';

import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutterlogin/lognUI.dart';
import 'package:flutterlogin/reg_users.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';
import 'home.dart';
import 'lognUI.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'firebase_authentication.dart';
import 'package:firebase_core/firebase_core.dart';

//void main() => runApp(MaterialApp(home: MyApp()));
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (_) => Authentication(),
        ),
        StreamProvider(
          create: (context) => context.read<Authentication>().getUser,
          initialData: RegUsers(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter&Firebase",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Consumer<RegUsers>(
        builder: (context, user, _) {
          if (user.uid == "") {
            return LoginView();
          } else {
            return SecondRoute(user: user);
          }
        },
      ),
    );
  }
}
