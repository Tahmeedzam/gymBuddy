import 'package:flutter/material.dart';
import 'package:gymbuddy/components/signInButtons.dart';

class TrainerSignOptions extends StatefulWidget {
  const TrainerSignOptions({super.key});

  @override
  State<TrainerSignOptions> createState() => _TrainerSignOptionsState();
}

class _TrainerSignOptionsState extends State<TrainerSignOptions> {
  onGoogleTap() {
    print("Google Clicked");
  }

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
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.15,

                alignment: Alignment.center,
                child: Text.rich(
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: 'Guide ', // Default text
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 24,
                    ),
                    children: [
                      TextSpan(
                        text: 'your Clients ',
                        style: TextStyle(
                          fontFamily: 'InterBold',
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 24,
                        ),
                      ),
                      TextSpan(
                        text: 'from ',
                        style: TextStyle(fontFamily: 'Inter', fontSize: 24),
                      ),
                      TextSpan(
                        text: 'anywhere ',
                        style: TextStyle(
                          fontFamily: 'InterBold',
                          fontStyle: FontStyle.italic,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 80),
              Container(
                height: 45,
                width:
                    MediaQuery.of(context).size.width *
                    (255 / MediaQuery.of(context).size.width),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: [Color(0xff009C47), Color(0xff00C853)],
                    stops: [0.1, 0.71],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign up now",
                      style: TextStyle(
                        fontFamily: 'InterBold',
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ],
                ),
                // child: Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     children: [Image.asset("assets/images/google.png")],
                //   ),
                // ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SignInButton(
                  buttonText: "Google",
                  imageLocation: "assets/images/google.png",
                  onTap: onGoogleTap,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SignInButton(
                  buttonText: "Apple",
                  imageLocation: "assets/images/appleLogo.png",
                  onTap: onGoogleTap,
                ),
              ),
              SizedBox(height: 80),
              Text(
                "Login",
                style: TextStyle(
                  fontFamily: 'InterBold',
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Back",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
