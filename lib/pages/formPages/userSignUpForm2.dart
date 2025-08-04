import 'package:flutter/material.dart';

class userSignUpForm2 extends StatefulWidget {
  const userSignUpForm2({super.key});

  @override
  State<userSignUpForm2> createState() => _userSignUpForm2State();
}

class _userSignUpForm2State extends State<userSignUpForm2> {
  final otpController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    otpController.dispose();
    super.dispose();
  }

  void handleSubmit() {}

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
                Align(
                  alignment: Alignment.topLeft,
                  child: Text.rich(
                    textAlign: TextAlign.left,
                    TextSpan(
                      text: "Let's verify\n",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 24,
                      ),
                      children: [
                        TextSpan(
                          text: 'Yourself',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'InterBold',
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 40),
                Text.rich(
                  textAlign: TextAlign.left,
                  TextSpan(
                    text:
                        "We’ve send a One-Time-Password (OTP) to your provided email account, Please don’t share this code to anyone.",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                    children: [
                      TextSpan(
                        text:
                            "\n\n\nEnter the Code below to verify your email.",
                        style: TextStyle(
                          fontFamily: "Inter",
                          color: Theme.of(
                            context,
                          ).colorScheme.onSecondaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 26),
                TextFormField(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontFamily: 'Inter',
                  ),
                  decoration: InputDecoration(
                    counterText: '', // Hides the "0/6" counter
                    hintText: 'OTP:',
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'OTP cannot be empty';
                    } else if (value.length < 6) {
                      return 'Enter complete OTP';
                    }
                    return null;
                  },
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
                        handleSubmit;
                        Navigator.pushNamed(context, '/signupForm3');
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
                            "Verify",
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
