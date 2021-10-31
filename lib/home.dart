import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterlogin/firebase_authentication.dart';
import 'package:flutterlogin/lognUI.dart';
import 'profilecard.dart';
import 'doctors.dart';
import 'main.dart';
import 'lognUI.dart';
import 'firebase_authentication.dart';
import 'reg_users.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class SecondRoute extends StatelessWidget {
  final RegUsers user;

  const SecondRoute({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //RegUsers user = context.read<Authentication>().currentUser;
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: AppBar(
              backgroundColor: Colors.blue.shade900,
              title: Row(
                children: [
                  Image.asset(
                    'assets/images/LOGO3.png',
                    fit: BoxFit.cover,
                    width: 150,
                  ),
                  Row(
                    children: [
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
              actions: [
                Row(children: [
                  TextButton(
                      child: Text(
                        "Home",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      style: ButtonStyle(),
                      onPressed: () {
                        /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondRoute(user: null,)),
                        );*/
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  Row(children: [
                    TextButton(
                        child: Text(
                          "About US",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        style: ButtonStyle(),
                        onPressed: () {
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondRoute()),
                          );*/
                        }),
                  ]),
                  SizedBox(
                    width: 10,
                  ),
                  Row(children: [
                    TextButton(
                        child: Text(
                          "Facilities",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        style: ButtonStyle(),
                        onPressed: () {
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondRoute()),
                          );*/
                        }),
                  ]),
                  SizedBox(
                    width: 10,
                  ),
                  Row(children: [
                    TextButton(
                        child: Text(
                          "News and Promos",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        style: ButtonStyle(),
                        onPressed: () {
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondRoute()),
                          );*/
                        }),
                    SizedBox(
                      width: 30,
                    ),
                  ]),
                ])
              ],
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        child: ClipOval(
                            child: Image.network(
                          user.photoUrl,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Image(
                              filterQuality: FilterQuality.high,
                              image: AssetImage("google.png"),
                            );
                          },
                          width: 50,
                          height: 50,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.fitWidth,
                        )),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(user.displayname),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(user.email),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ListTile(
                  title: Text('Profile'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: Text('Medication'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: Text('Appointments'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: Text('Payments'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: Text('History'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: Text('Settings'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: Text(
                    'Log Out',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () async {
                    await Authentication().logOut(context).whenComplete(
                      () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginView()),
                            (route) => false);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          body: StickyFooterScrollView(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 40),
                child: Center(
                  child: SizedBox(
                    height: 2000,
                    width: 1160,
                    child: Row(children: [
                      SizedBox(
                        height: 5000,
                        width: 1151,
                        child: Card(
                          child: Center(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 480,
                                      width: 1142,
                                      child: Swiper(
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Image.network(
                                            "assets/images/ADS2.png",
                                          );
                                        },
                                        itemCount: 3,
                                        pagination: SwiperPagination(),
                                        control: SwiperControl(),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 40,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Now Serving',
                                      style: TextStyle(
                                          fontSize: 42, color: Colors.orange),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Token Number:",
                                      style: TextStyle(
                                        fontSize: 42,
                                        color: Colors.blue.shade800,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "21394123",
                                      style: TextStyle(
                                          fontSize: 72,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Serving Time",
                                      style: TextStyle(fontSize: 32),
                                    ),
                                  ],
                                ),
                                /*Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),*/
                                Column(
                                  children: [
                                    Text(
                                      "00:45:15",
                                      style: TextStyle(fontSize: 42),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 230),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 80,
                                            width: 230,
                                            child: Card(
                                              child: Center(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      'Patients served',
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          color:
                                                              Colors.blueGrey),
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          "30",
                                                          style: TextStyle(
                                                              fontSize: 32,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 80,
                                                width: 229,
                                                child: Card(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "Performance",
                                                        style: TextStyle(
                                                            fontSize: 24,
                                                            color: Colors
                                                                .blueGrey),
                                                      ),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "FAST",
                                                            style: TextStyle(
                                                                fontSize: 32,
                                                                color: Colors
                                                                    .yellow),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 80,
                                                width: 229,
                                                child: Card(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "Your Token No.",
                                                        style: TextStyle(
                                                            fontSize: 24,
                                                            color: Colors
                                                                .blueGrey),
                                                      ),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "2130923",
                                                            style: TextStyle(
                                                                fontSize: 32,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Divider(
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Available Doctors",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 50),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 400,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        padding: const EdgeInsets.all(5.0),
                                        child:
                                            StreamProvider<List<Doctors>>.value(
                                          value: Authentication().getUser2(),
                                          builder: (context, snapshot) {
                                            List<Doctors> users =
                                                Provider.of<List<Doctors>>(
                                                    context);
                                            return Wrap(
                                              alignment: WrapAlignment.center,
                                              direction: Axis.horizontal,
                                              children: users.map((user) {
                                                return ProfileCard(
                                                  user: user,
                                                );
                                              }).toList(),
                                            );
                                          },
                                          initialData: [],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 480,
                                      width: 1142,
                                      child: Card(
                                        child: Image.asset(
                                            "assets/images/slider2.png"),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              );
            },
            footer: SizedBox(
              height: 300,
              width: 3000,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                ),
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 400,
                        child: Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: SizedBox(
                                  width: 400,
                                  child: Text(
                                    'Data Privacy Office',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 32),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: SizedBox(
                                  width: 400,
                                  child: Text(
                                    '8/F Norberto Ty Medical Tower IIManila Doctors Hospital',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: SizedBox(
                                  width: 400,
                                  child: Text(
                                    '(+632)8558-0888 ext. 0611',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: SizedBox(
                                  width: 400,
                                  child: Text(
                                    'privacy@www.maniladoctors.com.ph',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 300,
                      ),
                      Column(
                        children: [
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
                                  padding: EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                    width: 40,
                                    child:
                                        Image.asset('assets/images/google.png'),
                                  ),
                                ),
                              ),
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
