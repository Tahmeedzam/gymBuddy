import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymbuddy/components/customAppBar.dart';
import 'package:gymbuddy/components/todayGoal.dart';
import 'package:gymbuddy/providers/userDataProvider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? uid;

  @override
  void initState() {
    super.initState();
    uid = FirebaseAuth.instance.currentUser?.uid;

    final provider = Provider.of<FormDataProvider>(context, listen: false);
    provider.fetchUserData(uid!); // Replace with actual uid
  }

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Good Morning,';
    } else if (hour < 17) {
      return 'Good Afternoon,';
    } else {
      return 'Good Evening,';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FormDataProvider>(
      builder: (context, provider, _) {
        final user = provider.formData;

        if (user.name == null) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.green,
              backgroundColor: Colors.grey.withAlpha(50),
            ),
          );
        }

        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.primary,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 12,
                  ),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getGreeting(),
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Inter',
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                        Text(
                          "${user.name}",
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'InterBold',
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(child: TodayGoalCard()),
                      ],
                    ),
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
