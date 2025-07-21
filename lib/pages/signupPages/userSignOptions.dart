import 'package:flutter/material.dart';

class UserSignOptions extends StatefulWidget {
  const UserSignOptions({super.key});

  @override
  State<UserSignOptions> createState() => _UserSignOptionsState();
}

class _UserSignOptionsState extends State<UserSignOptions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 120),
              Text(
                "<logo>",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontFamily: "InterBold",
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 100,
                width: 120,
                alignment: Alignment.center,
                child: Text(
                  "Grind with your Buddies from anywhere",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
