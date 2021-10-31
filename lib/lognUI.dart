import 'dart:js';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'reg_users.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';
import 'home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'firebase_authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'loginnotifier.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  //_LoginViewState createState() => _LoginViewState();
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInViewModel>(
      create: (context) => SignInViewModel(context.read),
      builder: (context, child) {
        return Scaffold(
          body: LoginViewState(),
        );
      },
    );
  }
}

class LoginViewState extends StatelessWidget {
  const LoginViewState({Key? key}) : super(key: key);
  @override
  /*Widget build(BuildContext context) {
    double mwidth = MediaQuery.of(context).size.width;
    double mheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: mwidth,
        height: mheight,
        child: Text("sadasdasda"),
      ),
    );
  }*/

  Widget build(BuildContext context) {
    final isLoading =
        context.select((SignInViewModel viewModel) => viewModel.isLoading);
    return MaterialApp(
      title: "MoonLight",
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SizedBox(
              height: 700,
              width: 1160,
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    /*(const ListTile(
                      leading: CircleAvatar(backgroundImage: ''),
                      title: Text('ghostlamp'),
                    ),*/
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 200,
                          child: Padding(
                            padding: EdgeInsets.only(left: 60, top: 40),
                            child: Image.asset("assets/images/gl.png"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              child: SizedBox(
                                width: 700,
                                height: 500,
                                child: Image.asset('assets/images/sidepic.jpg'),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: SizedBox(
                                        height: 70,
                                        width: 300,
                                        child: Text(
                                          'Welcome Back :)',
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40,
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: SizedBox(
                                      height: 30,
                                      child: Text(
                                        'To Keep connected with us  please login with your personal',
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: SizedBox(
                                      height: 50,
                                      child: Text(
                                        'information by email address and password',
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 30, right: 20),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 80, bottom: 30),
                                        child: Text(
                                          "",
                                          style: const TextStyle(
                                              fontSize: 13, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      isLoading
                                          ? _loadingIndicator()
                                          : loginButton(context),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  TextButton(
                                      child: Text(
                                        "Login Anonymously",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<
                                            EdgeInsets>(EdgeInsets.all(25)),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.green),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.green),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            side:
                                                BorderSide(color: Colors.green),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        /*Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SecondRoute()),
                                        );*/
                                      }),
                                ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      "or you can join with",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10, top: 10),
                                    child: SizedBox(
                                      width: 40,
                                      child: Image.asset(
                                        'assets/images/facebook.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10, top: 10),
                                    child: SizedBox(
                                      width: 40,
                                      child: Image.asset(
                                          'assets/images/twitter.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Center _loadingIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

// ignore: non_constant_identifier_names
Widget loginButton(BuildContext context) {
  return TextButton(
    onPressed: () {
      context.read<Authentication>().loginWithGoogle();
    },
    child: Text(
      "    Sign In With Google   ",
      style: TextStyle(fontSize: 14, color: Colors.white),
    ),
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(25)),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Colors.blue),
        ),
      ),
    ),
  );
}
