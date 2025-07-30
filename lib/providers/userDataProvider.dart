import 'package:flutter/material.dart';
import 'package:gymbuddy/models/userFormData.dart';

class FormDataProvider extends ChangeNotifier {
  final UserModel _formData = UserModel();

  UserModel get data => _formData;
  UserModel get formData => _formData;
  String? get location => _formData.location;

  //FormPage1
  void updateProfileImageUrl(String value) {
    _formData.profileImageUrl = value;
    notifyListeners();
  }

  void updateName(String value) {
    _formData.name = value;
    notifyListeners();
  }

  void updateUsername(String value) {
    _formData.username = value;
    notifyListeners();
  }

  void updateGender(String value) {
    _formData.gender = value;
    notifyListeners();
  }

  void updateDob(DateTime value) {
    _formData.dob = value;
    notifyListeners();
  }

  void updateEmail(String value) {
    _formData.email = value;
    notifyListeners();
  }

  void updateLocation(String value) {
    _formData.location = value;
    notifyListeners();
  }

  //Form2
  void updateHeight(double value) {
    _formData.height = value;
    notifyListeners();
  }

  void updateWeight(double value) {
    _formData.weight = value;
    notifyListeners();
  }

  void updateBMI(double value) {
    _formData.bmi = value;
    notifyListeners();
  }

  void updateBMIString(String? value) {
    _formData.bmiStringResult = value;
    notifyListeners();
  }

  void updateFitnessLevelString(String? level) {
    _formData.fitnessLevelName = level;
    notifyListeners();
  }

  void updateBio(String value) {
    _formData.bio = value;
    notifyListeners();
  }

  void updateJoiningDate(DateTime value) {
    _formData.joiningDate = value;
    notifyListeners();
  }

  void resetForm() {
    _formData.reset();
    notifyListeners();
  }
}
