import 'package:flutter/material.dart';
import './firebase/auth_service.dart';
import './main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  String? error = "";

  String email = "";
  String password = "";

  bool isDisabled = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    emailController.addListener(() {
      setState(() {
        email = emailController.text;
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

    passwordController.addListener(() {
      setState(() {
        password = passwordController.text;
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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void submitHandler() async {
    String? res = await AuthService().logIn(email, password);

    if (res == "200") {
      if (!mounted) return;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const HomePage(title: 'Home')));
    } else {
      setState(() {
        error = "Invalid email or password";
      });
    }
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
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 20),
              Builder(builder: (builder) {
                if (error == "") {
                  return Text("");
                } else {
                  return Column(children: <Widget>[
                    Text("$error", style: TextStyle(color: Colors.red)),
                    SizedBox(height: 10)
                  ]);
                }
              }),
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
