import 'package:flutter/material.dart';
import 'package:gymbuddy/providers/userDataProvider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class TodayGoalCard extends StatefulWidget {
  const TodayGoalCard({super.key});

  @override
  State<TodayGoalCard> createState() => _TodayGoalCardState();
}

class _TodayGoalCardState extends State<TodayGoalCard> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<FormDataProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FormDataProvider>(
      builder: (context, provider, _) {
        final user = provider.formData;
        return Container(
          height: 200,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: LinearGradient(
              colors: [Color(0xff009C47), Color(0xff00C853)],
              stops: [0.1, 0.65],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 22.0,
              bottom: 22.0,
              left: 20.0,
              right: 18,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today's",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      Text(
                        "Goal",
                        style: TextStyle(
                          fontFamily: 'InterBold',
                          fontSize: 26,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${user.dailyExerciseMinutes.toString()} Mins",
                                style: TextStyle(
                                  fontFamily: "InterBold",
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "Time",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 16,
                                ),
                              ),
                              LinearPercentIndicator(
                                padding: EdgeInsets.all(0),
                                width: 75,
                                lineHeight: 5,
                                percent: 0.75,
                                progressColor: Colors.white.withAlpha(190),
                                backgroundColor: Color(0xff00E676),
                                barRadius: Radius.circular(4),
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${user.dailyKcalBurn.toString()} Kcal",
                                style: TextStyle(
                                  fontFamily: "InterBold",
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "Burned",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 16,
                                ),
                              ),
                              LinearPercentIndicator(
                                padding: EdgeInsets.all(0),
                                width: 80,
                                lineHeight: 5,
                                percent: 0.75,
                                progressColor: Colors.white.withAlpha(190),
                                backgroundColor: Color(0xff00E676),
                                barRadius: Radius.circular(4),
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: CircularPercentIndicator(
                          radius: 65.0,
                          lineWidth: 8.0,
                          animation: true,
                          percent: 0.7,
                          center: new Text(
                            "70%",
                            style: new TextStyle(
                              fontFamily: "InterBold",
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontSize: 20.0,
                            ),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.white.withAlpha(190),
                          backgroundColor: Color(0xff00E676),
                        ),
                      ),
                      // Spacer(),

                      // Align(
                      //   alignment: Alignment.bottomRight,
                      //   child: Text(
                      //     "Updated 10:42 AM",
                      //     style: TextStyle(fontSize: 10),
                      //   ),
                      // ),
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
