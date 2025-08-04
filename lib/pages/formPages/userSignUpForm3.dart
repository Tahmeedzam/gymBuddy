import 'package:flutter/material.dart';

class userSignUpForm3 extends StatefulWidget {
  const userSignUpForm3({super.key});

  @override
  State<userSignUpForm3> createState() => _userSignUpForm3State();
}

class _userSignUpForm3State extends State<userSignUpForm3> {
  final referralController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    referralController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 42, vertical: 32),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text.rich(
                        textAlign: TextAlign.left,
                        TextSpan(
                          text: "Did any friend\n",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 24,
                          ),
                          children: [
                            TextSpan(
                              text: 'invited',
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'InterBold',
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            TextSpan(
                              text: ' you?',
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signupForm4');
                      },
                      child: Container(
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Theme.of(
                              context,
                            ).colorScheme.onSecondaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40),
                Text.rich(
                  textAlign: TextAlign.left,
                  TextSpan(
                    text:
                        "Enter valid Referral code provided by your friend and gain 30 Tokens ",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                ),

                SizedBox(height: 26),
                TextFormField(
                  controller: referralController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontFamily: 'Inter',
                  ),
                  decoration: InputDecoration(
                    counterText: '', // Hides the "0/6" counter
                    hintText: 'Referral Code:',
                    hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 1.2,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.tertiary,
                        width: 1.2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red, width: 1.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),

                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Back",
                        style: TextStyle(
                          fontFamily: "Inter",
                          color: Theme.of(
                            context,
                          ).colorScheme.onSecondaryContainer,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signupForm4');
                      },
                      child: Container(
                        height: 42,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            colors: [Color(0xff009C47), Color(0xff00C853)],
                            stops: [0.1, 0.71],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              fontFamily: "InterBold",
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
