import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';
import 'home.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  get valuesecond => null;

  @override
  Widget build(BuildContext context) {
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
                                  TextButton(
                                      child: Text(
                                        "Sign In With Google",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<
                                            EdgeInsets>(EdgeInsets.all(25)),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.blue),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.blue),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            side:
                                                BorderSide(color: Colors.blue),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SecondRoute()),
                                        );
                                      }),
                                  SizedBox(width: 30),
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SecondRoute()),
                                        );
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
