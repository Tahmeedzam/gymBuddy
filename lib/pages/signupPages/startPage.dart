import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Container(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      // * Intro name and Logo
                      child: Column(
                        children: [
                          Text(
                            "We're...",
                            style: TextStyle(fontSize: 24, fontFamily: "Inter"),
                          ),
                          Text(
                            "GymBuddy",
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: "InterBold",
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(height: 20),
                          // TODO : Add Logo here
                          Text(
                            "<logo>",
                            style: TextStyle(fontSize: 24, fontFamily: "Inter"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 150),
                    Column(
                      children: [
                        Text(
                          "And...",
                          style: TextStyle(fontSize: 24, fontFamily: "Inter"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "You",
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: "InterBold",
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Text(
                              " are a?",
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: "Inter",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // * Buttons
                    SizedBox(height: 50),
                    Column(
                      children: [
                        Container(
                          height: 42,
                          width: 170,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.tertiary,
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(
                                  context,
                                ).colorScheme.tertiary.withAlpha(150),
                                blurRadius: 3,
                                spreadRadius: 2,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          child: Center(
                            child: Text(
                              "Gymer",
                              style: TextStyle(
                                fontFamily: "InterBold",
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "or",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          height: 42,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          child: Center(
                            child: Text(
                              "Trainer",
                              style: TextStyle(
                                fontFamily: "InterBold",
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
