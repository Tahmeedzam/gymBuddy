import 'package:flutter/material.dart';
import 'package:gymbuddy/providers/userDataProvider.dart';
import 'package:provider/provider.dart';

class UserSignUpForm6 extends StatefulWidget {
  const UserSignUpForm6({super.key});

  @override
  State<UserSignUpForm6> createState() => _UserSignUpForm6State();
}

class _UserSignUpForm6State extends State<UserSignUpForm6> {
  final days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  void showWorkoutModal(
    BuildContext context,
    String day,
    List<String> selectedOptions,
    Function(List<String>) onSave,
  ) {
    List<String> allOptions = [
      'Abs',
      'Chest',
      'Shoulder',
      'Back',
      'Triceps',
      'Biceps',
      'Cardio',
      'Functional',
      'Legs',
      'Rest day',
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      builder: (context) {
        return SizedBox(
          height:
              MediaQuery.of(context).size.height * 0.50, // 85% of screen height
          child: StatefulBuilder(
            builder: (context, setState) {
              bool isRestDaySelected = selectedOptions.contains('Rest day');

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 30,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          day,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 4,
                        width: MediaQuery.of(context).size.width * 0.90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    /// Options
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: allOptions.map((option) {
                        final isSelected = selectedOptions.contains(option);
                        final isDisabled =
                            isRestDaySelected && option != 'Rest day';

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (option == 'Rest day') {
                                if (selectedOptions.contains('Rest day')) {
                                  selectedOptions.remove(
                                    'Rest day',
                                  ); // ✅ Deselect
                                } else {
                                  selectedOptions = [
                                    'Rest day',
                                  ]; // ✅ Select only 'Rest day'
                                }
                              } else {
                                if (selectedOptions.contains('Rest day')) {
                                  // Remove 'Rest day' if any other is being selected
                                  selectedOptions.remove('Rest day');
                                }

                                if (selectedOptions.contains(option)) {
                                  selectedOptions.remove(option);
                                } else {
                                  selectedOptions.add(option);
                                }
                              }
                            });
                          },

                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 14,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: isSelected
                                  ? Theme.of(context).colorScheme.tertiary
                                  : Colors.transparent,
                              border: Border.all(
                                width: 1.2,
                                color: isDisabled
                                    ? Colors.grey
                                    : Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                            child: Text(
                              option,
                              style: isSelected
                                  ? TextStyle(
                                      // 👇 Use your selected text style
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    )
                                  : TextStyle(
                                      // 👇 Use your unselected text style
                                      color: isDisabled
                                          ? Colors.grey
                                          : Theme.of(
                                              context,
                                            ).colorScheme.onSecondaryContainer,
                                    ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 50),

                    /// Done button
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 4,
                        width: MediaQuery.of(context).size.width * 0.90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          onSave(selectedOptions);
                          Navigator.pop(context);
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
                              "Done",
                              style: TextStyle(
                                fontFamily: "InterBold",
                                fontSize: 14,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
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
                          text: "Let's set your\n",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 24,
                          ),
                          children: [
                            TextSpan(
                              text: 'Weekly',
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Inter',
                              ),
                            ),
                            TextSpan(
                              text: ' Goal',
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
                    GestureDetector(
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

                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "It’s recommended to include at least 2 rest days per week.",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      fontFamily: "Inter",
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Consumer<FormDataProvider>(
                  builder: (context, provider, _) {
                    return Column(
                      children: provider.weeklyGoal.keys.map((day) {
                        final selectedOptions = provider.weeklyGoal[day] ?? [];

                        return ListTile(
                          title: Text(
                            day,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontFamily: 'Inter',
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            selectedOptions.isEmpty
                                ? 'No workout selected'
                                : selectedOptions.join(', '),
                            style: selectedOptions.isEmpty
                                ? TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSecondaryContainer,
                                    fontSize: 12,
                                  )
                                : TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSecondary,
                                    fontSize: 12,
                                  ),
                          ),
                          trailing: Icon(
                            selectedOptions.isEmpty
                                ? Icons.check_box_outline_blank_outlined
                                : Icons.check_box,
                            color: selectedOptions.isEmpty
                                ? Theme.of(
                                    context,
                                  ).colorScheme.onSecondaryContainer
                                : Theme.of(context).colorScheme.tertiary,
                          ),
                          onTap: () {
                            showWorkoutModal(
                              context,
                              day, // or dynamically set the day
                              provider.weeklyGoal[day] ?? [],
                              (selectedOptions) {
                                provider.updateDayGoal(day, selectedOptions);
                              },
                            );
                          },
                        );
                      }).toList(),
                    );
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
                      onTap: () {},
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
                          child: GestureDetector(
                            onTap: () {
                              final provider = Provider.of<FormDataProvider>(
                                context,
                                listen: false,
                              );

                              // Replace these lists with your actual selected options per day
                              final weeklyData = {
                                'Monday': provider.weeklyGoal['Monday'] ?? [],
                                'Tuesday': provider.weeklyGoal['Tuesday'] ?? [],
                                'Wednesday':
                                    provider.weeklyGoal['Wednesday'] ?? [],
                                'Thursday':
                                    provider.weeklyGoal['Thursday'] ?? [],
                                'Friday': provider.weeklyGoal['Friday'] ?? [],
                                'Saturday':
                                    provider.weeklyGoal['Saturday'] ?? [],
                                'Sunday': provider.weeklyGoal['Sunday'] ?? [],
                              };

                              provider.updateWeeklyGoal(weeklyData);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Weekly routine saved ✅'),
                                ),
                              );
                              print(provider.weeklyGoal);
                            },
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                fontFamily: "InterBold",
                                fontSize: 14,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondary,
                              ),
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
