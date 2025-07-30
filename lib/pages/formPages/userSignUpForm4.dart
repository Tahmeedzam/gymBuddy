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
  String? bmiStringResult;
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
        setState(() {
          bmiHeader = "You're Underweight";
          bmiStringResult = "Underweight";
          bmiMessage =
              "You're doing great! It might help to fuel your body with a bit more nutrition. Small steps and a balanced plan can make a big difference. Keep going!";
          provider.updateBMIString(bmiStringResult);
        });
      } else if (bmiValue < 24.5) {
        setState(() {
          bmiHeader = "Healthy Weight";
          bmiStringResult = "Healthy";
          bmiMessage =
              "Awesome! You're in a healthy range — keep maintaining your lifestyle and staying consistent. Your body will thank you!";
          provider.updateBMIString(bmiStringResult);
        });
      } else if (bmiValue < 29.9) {
        setState(() {
          bmiHeader = "You're Overweight";
          bmiStringResult = "Overweight";
          bmiMessage =
              "You're on the journey — and that's what matters. A few mindful adjustments and regular activity can work wonders. You’ve got this!";
          provider.updateBMIString(bmiStringResult);
        });
      } else {
        setState(() {
          bmiHeader = "You're Obese";
          bmiStringResult = "Obese";
          bmiMessage =
              "Progress starts with awareness. You’re taking the first step by tracking — and that’s huge! Keep moving forward, one day at a time. You’re not alone in this!";
          provider.updateBMIString(bmiStringResult);
        });
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
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Text(
                  'Select your level:',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: List.generate(3, (index) {
                  final labels = ['Beginner', 'Moderate', 'Advanced'];
                  final isSelected = index == selectedLevel;
                  String? selectedLevelName;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLevel = index;
                          selectedLevelName = labels[index];
                        });
                        provider.updateFitnessLevelString(selectedLevelName);
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
                              ? Color(0xff009C47)
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
                      print('BMI: ${user.bmiStringResult}');
                      print('Level: ${user.fitnessLevelName}');
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
