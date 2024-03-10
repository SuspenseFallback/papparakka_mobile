import 'package:flutter/material.dart';
import './tag.dart';

class UICard extends StatelessWidget {
  const UICard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 12.0, right: 12.0),
      child: Card(
          child: Padding(
        padding: EdgeInsets.all(12.0),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Wrap(direction: Axis.vertical, spacing: 2, children: <Widget>[
                Text('Title',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('Subtitle', style: TextStyle(fontSize: 13)),
              ]),
              Wrap(
                direction: Axis.vertical,
                spacing: 2,
                children: <Widget>[
                  Wrap(
                    spacing: 5,
                    children: [
                      UITag(label: 'tag1'),
                      UITag(label: 'tag2'),
                    ],
                  ),
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: 'CREATED BY '),
                        TextSpan(
                            text: 'USER',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
