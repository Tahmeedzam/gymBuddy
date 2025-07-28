import 'package:flutter/material.dart';
import 'package:gymbuddy/components/longTextField.dart';
import 'package:gymbuddy/providers/userDataProvider.dart';
import 'package:provider/provider.dart';

class userSignUpForm4 extends StatefulWidget {
  const userSignUpForm4({super.key});

  @override
  State<userSignUpForm4> createState() => _userSignUpForm4State();
}

class _userSignUpForm4State extends State<userSignUpForm4> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  String? bmiHeader;
  String? bmiMessage;
  double? bmi;

  int selectedLevel = 1;

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    heightController.addListener(_calculateBMI);
    weightController.addListener(_calculateBMI);
  }

  void _calculateBMI() {
    final provider = Provider.of<FormDataProvider>(context, listen: false);
    final heightText = heightController.text.trim();
    final weightText = weightController.text.trim();

    final heightCm = double.tryParse(heightText);
    final weight = double.tryParse(weightText);

    if (heightCm != null && weight != null && heightCm > 0) {
      final heightM = heightCm / 100;
      final bmiValue = weight / (heightM * heightM);
      setState(() {
        bmi = bmiValue;
      });

      provider.updateHeight(heightCm);
      provider.updateWeight(weight);
      provider.updateBMI(bmiValue);

      if (bmiValue < 18.5) {
        bmiHeader = "You're Underweight";
        bmiMessage = "...";
      } else if (bmiValue < 24.5) {
        bmiHeader = "Healthy Weight";
        bmiMessage = "...";
      } else if (bmiValue < 29.9) {
        bmiHeader = "You're Overweight";
        bmiMessage = "...";
      } else {
        bmiHeader = "You're Obese";
        bmiMessage = "...";
      }
    } else {
      setState(() {
        bmi = null;
        bmiHeader = null;
        bmiMessage = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final provider = Provider.of<FormDataProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header text
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 24,
                    color: colorScheme.onSecondary,
                  ),
                  children: const [
                    TextSpan(text: "Let's talk\nabout "),
                    TextSpan(
                      text: 'Body',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Height and Weight fields
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: heightController,
                      hintText: 'Height (cm)',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomTextField(
                      controller: weightController,
                      hintText: 'Weight',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              bmi != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            'Your BMI Result',
                            style: TextStyle(
                              fontFamily: 'InterBold',
                              fontSize: 18,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSecondaryContainer,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'BMI: ${bmi!.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontFamily: 'InterBold',
                                  fontSize: 16,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSecondary,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                bmiHeader ?? '',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSecondary,
                                ),
                              ),
                              Text(
                                bmiMessage ?? '',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSecondaryContainer,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : SizedBox.shrink(),

              // Show nothing when BMI is not calculated
              const SizedBox(height: 24),

              // Level selector
              Row(
                children: List.generate(3, (index) {
                  final labels = ['Beginner', 'Moderate', 'Advanced'];
                  final isSelected = index == selectedLevel;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLevel = index;
                        });
                        provider.updateFitnessLevel(index);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isSelected
                              ? colorScheme.secondary
                              : Colors.transparent,
                          border: Border.all(
                            color: colorScheme.onSecondary,
                            width: 1.5,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          labels[index],
                          style: TextStyle(
                            color: colorScheme.onSecondary,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 50),

              // Bottom navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(
                        color: colorScheme.onSecondaryContainer,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      final provider = Provider.of<FormDataProvider>(
                        context,
                        listen: false,
                      );
                      final user = provider.formData;

                      print('--- User Form Data ---');
                      print('Name: ${user.name}');
                      print('Email: ${user.email}');
                      print('Gender: ${user.gender}');
                      print('DOB: ${user.dob}');
                      print('Height: ${user.height}');
                      print('Weight: ${user.weight}');
                      print('BMI: ${user.bmi}');
                      print('Level: ${user.fitnessLevel}');
                      print('Location: ${user.location}');
                      print('Bio: ${user.bio}');
                      print('Profile URL: ${user.profileImageUrl}');
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
                        child: GestureDetector(
                          onTap: () {
                            final provider = Provider.of<FormDataProvider>(
                              context,
                              listen: false,
                            );
                            final user = provider.formData;

                            print('--- User Form Data ---');
                            print('Name: ${user.name}');
                            print('Email: ${user.email}');
                            print('Gender: ${user.gender}');
                            print('DOB: ${user.dob}');
                            print('Height: ${user.height}');
                            print('Weight: ${user.weight}');
                            print('BMI: ${user.bmi}');
                            print('Level: ${user.fitnessLevel}');
                            print('Location: ${user.location}');
                            print('Bio: ${user.bio}');
                            print('Profile URL: ${user.profileImageUrl}');
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(
                              fontFamily: "InterBold",
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.onSecondary,
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
    );
  }
}
