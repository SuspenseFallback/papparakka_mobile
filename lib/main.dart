import 'package:flashcard_app_mobile/firebase/auth_service.dart';
import 'package:flutter/material.dart';
import './home.dart';
import './ui/card.dart';
import './nav/bottomnavbar.dart';
import './login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'firebase/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        home: const LoginPage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Object? sets = [];
  int cardsStudied = 0;
  User? user;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    Object? newSets = await DatabaseService().getSets();
    User? newUser = await AuthService().getUser();

    setState(() {
      sets = newSets;
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
            HomePageStats(cardsStudied: cardsStudied),
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
