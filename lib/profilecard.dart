import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterlogin/doctors.dart';
import 'package:flutterlogin/firebase_authentication.dart';
import 'package:flutterlogin/lognUI.dart';
import 'main.dart';
import 'lognUI.dart';
import 'firebase_authentication.dart';
import 'reg_users.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileCard extends StatelessWidget {
  final Doctors user;
  ProfileCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 25),
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                radius: 20,
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
              const SizedBox(
                height: 5,
              ),
              Text(
                user.docName,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 5,
              ),
              Text("Email: " + user.email, textAlign: TextAlign.left),
              const SizedBox(
                height: 5,
              ),
              Text("Patients Served: " + user.patients,
                  textAlign: TextAlign.left),
            ],
          ),
        ),
      ),
    );
  }
}
