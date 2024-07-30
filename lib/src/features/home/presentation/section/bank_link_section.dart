import 'package:flutter/material.dart';

class BankLinkSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Card.outlined(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            width: double.maxFinite,
            color: Colors.amber,
          ),
        ),
      );
}
