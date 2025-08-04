import 'package:flutter/material.dart';
import 'package:gymbuddy/components/locationDropDown.dart';
import 'package:gymbuddy/components/longTextField.dart';
import 'package:gymbuddy/components/passwordTextField.dart';
import 'package:gymbuddy/components/profileImagePicker.dart';
import 'package:gymbuddy/providers/userDataProvider.dart';
import 'package:provider/provider.dart';

class UserSignUpForm1 extends StatefulWidget {
  const UserSignUpForm1({super.key});

  @override
  State<UserSignUpForm1> createState() => _UserSignUpForm1State();
}

class _UserSignUpForm1State extends State<UserSignUpForm1> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? selectedGender;
  DateTime? selectedDob;
  List<String> countryList = [];
  String? selectedCountry;
  bool isLoading = true;
  int? age;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  bool handleSubmit() {
    if (_formKey.currentState!.validate()) {
      if (selectedGender == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Select your gender")));
        return false;
      }
      if (selectedDob == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Select your DOB")));
        return false;
      }

      if (selectedDob != null) {
        DateTime today = DateTime.now();
        age = today.year - selectedDob!.year;

        if (today.month < selectedDob!.month ||
            (today.month == selectedDob!.month &&
                today.day < selectedDob!.day)) {
          if (age != null) {
            age = age! - 1;
          }
        }
      }

      final provider = Provider.of<FormDataProvider>(context, listen: false);
      provider.updateName(nameController.text.trim());
      provider.updateUsername(usernameController.text.trim());
      provider.updateEmail(emailController.text.trim());
      provider.updatePassword(passwordController.text.trim());
      provider.updateGender(selectedGender!);
      provider.updateDob(selectedDob!);
      provider.updateAge(age!);

      // Debug print
      // print('Name: ${provider.formData.name}');
      // print('Username: ${provider.formData.username}');
      // print('Email: ${provider.formData.email}');
      // print('Gender: ${provider.formData.gender}');
      // print('DOB: ${provider.formData.dob}');
      // print('Age: ${provider.formData.age}');

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Step 1 saved ✅")));
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormDataProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 32),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text.rich(
                      textAlign: TextAlign.left,
                      TextSpan(
                        text: "Let's talk\n",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 24,
                        ),
                        children: [
                          TextSpan(text: 'about '),
                          TextSpan(
                            text: 'You',
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
                  SizedBox(height: 30),
                  // Image picker (optional)
                  ProfileImagePicker(),
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: nameController,
                    hintText: "Name: ",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    controller: usernameController,
                    hintText: "Username:",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      // Gender Dropdown
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: selectedGender,
                          items: ['Male', 'Female', 'Other'].map((gender) {
                            return DropdownMenuItem<String>(
                              value: gender,
                              child: Text(
                                gender,
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSecondary,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                          validator: (value) =>
                              value == null ? 'select a gender' : null,
                          decoration: InputDecoration(
                            hintText: 'Gender',
                            hintStyle: TextStyle(
                              fontFamily: "Inter",
                              color: Theme.of(
                                context,
                              ).colorScheme.onSecondaryContainer,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondary,
                                width: 1.2,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.red, // or your error color
                                width: 1.5,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Theme.of(
                                  context,
                                ).colorScheme.tertiary, // Keep it green
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.tertiary,
                                width: 2,
                              ),
                            ),
                          ),
                          dropdownColor: Theme.of(
                            context,
                          ).colorScheme.secondary,
                        ),
                      ),

                      SizedBox(width: 12), // spacing between fields
                      // DOB Picker
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime(2005, 1, 1),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: Theme.of(context).colorScheme
                                        .copyWith(
                                          primary: Theme.of(context)
                                              .colorScheme
                                              .tertiary, // Calendar circle + header
                                          onPrimary: Colors
                                              .black, // Text inside header circle
                                          onSurface: Theme.of(context)
                                              .colorScheme
                                              .onSecondary, // Calendar text
                                        ),
                                    dialogBackgroundColor: Theme.of(context)
                                        .colorScheme
                                        .primary, // Calendar background
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Theme.of(
                                          context,
                                        ).colorScheme.tertiary,
                                      ),
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            if (picked != null) {
                              setState(() {
                                selectedDob = picked;
                              });
                            }
                          },
                          child: AbsorbPointer(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: selectedDob == null
                                    ? 'Date of Birth'
                                    : '${selectedDob!.day}/${selectedDob!.month}/${selectedDob!.year}',
                                hintStyle: TextStyle(
                                  color: selectedDob == null
                                      ? Theme.of(
                                          context,
                                        ).colorScheme.onSecondaryContainer
                                      : Theme.of(
                                          context,
                                        ).colorScheme.onSecondary,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSecondary,
                                    width: 1.2,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.red, // or your error color
                                    width: 1.5,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.tertiary, // Keep it green
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.tertiary,
                                    width: 2,
                                  ),
                                ),
                              ),
                              validator: (_) => selectedDob == null
                                  ? 'Select your DOB'
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    controller: emailController,
                    hintText: "Email:",
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 16),
                  PasswordTextField(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  CountryPickerField(
                    selectedCountry: provider.location,
                    onCountrySelected: (country) =>
                        provider.updateLocation(country),
                  ),

                  SizedBox(height: 32),
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
                      Container(
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
                              if (handleSubmit()) {
                                Navigator.pushNamed(context, '/signupForm2');
                              }
                            },

                            child: Text(
                              "Verify",
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
