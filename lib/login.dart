import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './firebase/auth_service.dart';
import './main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _email_controller;
  late TextEditingController _password_controller;

  String email = "";
  String password = "";

  bool isDisabled = true;

  @override
  void initState() {
    super.initState();
    _email_controller = TextEditingController();
    _password_controller = TextEditingController();

    _email_controller.addListener(() {
      setState(() {
        email = _email_controller.text;
      });

      if (email != "" && password != "") {
        setState(() {
          isDisabled = false;
        });
      } else {
        setState(() {
          isDisabled = true;
        });
      }
    });

    _password_controller.addListener(() {
      setState(() {
        password = _password_controller.text;
      });

      if (email != "" && password != "") {
        setState(() {
          isDisabled = false;
        });
      } else {
        setState(() {
          isDisabled = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _email_controller.dispose();
    _password_controller.dispose();
    super.dispose();
  }

  void submitHandler() async {
    String? res = await AuthService().logIn(email, password);

    if (!mounted) return;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const HomePage(title: 'Home')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Log in',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(height: 30),
              TextField(
                controller: _email_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _password_controller,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 20),
              FilledButton(
                onPressed: isDisabled ? null : submitHandler,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5);
                        } else if (states.contains(MaterialState.disabled)) {
                          return Color.fromARGB(255, 235, 182, 112);
                        }
                        return Colors.orange; // Use the component's default.
                      },
                    ),
                    foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.black;
                        } else if (states.contains(MaterialState.disabled)) {
                          return Colors.black;
                          ;
                        }
                        return Colors.black; // Use the component's default.
                      },
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(width: 1)))),
                child: SizedBox(
                    width: 400,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Log in',
                        textAlign: TextAlign.center,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
