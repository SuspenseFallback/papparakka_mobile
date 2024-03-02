import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './home.dart';
import './ui/card.dart';
import './nav/bottomnavbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomePage(title: 'Papparakka'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: ListView(
          children: const <Widget>[
            HomePageStats(),
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
