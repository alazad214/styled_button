import 'package:flutter/material.dart';
import 'package:styled_button/styled_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Styled Button',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: StyledButton(
                  text: 'Google',
                  submit: () {},
                  provider: AuthButtonProvider.microsoft,
                  iconSide: IconSide.right,
                  iconSize: 10,


                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
