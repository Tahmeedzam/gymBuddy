import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymbuddy/providers/userDataProvider.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String? uid;

  @override
  void initState() {
    super.initState();
    uid = FirebaseAuth.instance.currentUser?.uid;

    final provider = Provider.of<FormDataProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FormDataProvider>(
      builder: (context, provider, _) {
        final user = provider.formData;
        return Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(user.profileImageUrl ?? ''),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    '| Level 5',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      fontSize: 16,
                    ),
                  ),
                ),
                Spacer(),

                //Todo: Change the notification logo
                Container(
                  child: Icon(
                    Icons.notifications_outlined,
                    color: Theme.of(context).colorScheme.onSecondary,
                    size: 26,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  child: Row(
                    children: [
                      Image.asset('assets/images/fire.png', scale: 26),
                      SizedBox(width: 5),
                      Text(
                        '5',
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSecondaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  child: Row(
                    children: [
                      Icon(
                        //Todo: Change to a good logo
                        Icons.attach_money_rounded,
                        color: Colors.yellow,
                        size: 26,
                      ),
                      Text(
                        '200',
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSecondaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
