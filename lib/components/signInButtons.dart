import 'package:flutter/material.dart';

class SignInButton extends StatefulWidget {
  final String buttonText;
  final String imageLocation;
  final VoidCallback onTap;

  const SignInButton({
    super.key,
    required this.buttonText,
    required this.imageLocation,
    required this.onTap,
  });

  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 45,
        width:
            MediaQuery.of(context).size.width *
            (255 / MediaQuery.of(context).size.width),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
          border: Border.all(
            color: Theme.of(context).colorScheme.onSecondary,
            width: 1.5,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 12,
              child: Image.asset(widget.imageLocation, height: 24),
            ),
            Center(
              child: Text(
                widget.buttonText,
                style: TextStyle(
                  fontFamily: 'InterBold',
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
