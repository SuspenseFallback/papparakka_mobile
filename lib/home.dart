import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePageStats extends StatelessWidget {
  const HomePageStats({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Text(
          'Your stats',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Text>[
                  Text('0',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                  Text('sets studied'),
                ],
              ),
              Column(
                children: <Text>[
                  Text('0',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                  Text('sets created'),
                ],
              ),
              Column(
                children: <Text>[
                  Text('0',
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