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

class DocProf extends StatelessWidget {
  final Doctors user;

  DocProf(this.user);

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: const Text(
        'Set Appointment',
        style: TextStyle(fontSize: 40),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: CircleAvatar(
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
                width: 100,
                height: 100,
                filterQuality: FilterQuality.high,
                fit: BoxFit.fitWidth,
              )),
            ),
          ),
          Text(""),
          Text("Doctor: " + user.docName),
          Text("Patients Served: " + user.patients),
          Text(""),
          Text("Available On: " + user.avail),
          Text("Speciality: " + user.field),
        ],
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Yes'),
        ),
        new TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('No'),
        ),
      ],
    );
  }
}
