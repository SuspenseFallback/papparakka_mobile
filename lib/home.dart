import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'firebase/database_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'firebase/auth_service.dart';
import './ui/card.dart';
import './nav/bottomnavbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Object? sets = [];
  int cardsStudied = 0;
  DocumentSnapshot? user;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    // DocumentSnapshot? newSets = await DatabaseService().getSets();
    DocumentSnapshot? newUser = await AuthService().getUser();

    setState(() {
      // sets = newSets;
      user = newUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: ListView(
          children: <Widget>[
            HomePageStats(
                cardsStudied: cardsStudied, username: user?.get("username")),
            Padding(
              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: Text('My sets',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            UICard(),
            UICard(),
            UICard(),
            UICard(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class HomePageStats extends StatelessWidget {
  const HomePageStats(
      {super.key, required this.cardsStudied, required this.username});

  final int cardsStudied;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '$username\'s stats',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: const <Text>[
                  Text('0',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                  Text('sets studied'),
                ],
              ),
              Column(
                children: const <Text>[
                  Text('0',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                  Text('sets created'),
                ],
              ),
              Column(
                children: <Text>[
                  Text('$cardsStudied',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                  Text('cards studied'),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
