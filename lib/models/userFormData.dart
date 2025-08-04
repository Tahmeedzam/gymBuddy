import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  //Automatic
  bool? verified;
  bool? referralUsed;
  DateTime? joiningDate;

  //Form1
  String? profileImageUrl;
  String? uid;
  String? name;
  String? username;
  String? gender;
  DateTime? dob;
  int? age;
  String? email;
  String? password;
  String? location;

  //Form2
  double? height;
  double? weight;
  double? bmi;
  String? bmiStringResult;
  String? fitnessLevelName;

  //form3
  int? dailyExerciseMinutes;
  int? dailyKcalBurn;

  //Form4
  Map<String, List<String>>? weeklyWorkoutPlan;

  String? bio;

  UserModel({
    //Form1
    this.profileImageUrl,
    this.uid,
    this.name,
    this.username,
    this.gender,
    this.dob,
    this.age,
    this.email,
    this.password,
    this.location,
    this.verified,
    this.referralUsed,

    //Form2
    this.height,
    this.weight,
    this.bmi,
    this.bmiStringResult,
    this.fitnessLevelName,

    //Form3
    this.dailyExerciseMinutes,
    this.dailyKcalBurn,

    //Form4
    this.weeklyWorkoutPlan,

    this.bio,
    this.joiningDate,
  });

  // Convert to Firestore-friendly Map
  Map<String, dynamic> toMap() {
    return {
      //form1
      'userProfileImageUrl': profileImageUrl,
      'uid': uid,
      'userFullName': name,
      'userName': username,
      'userGender': gender,
      'userDOB': dob,
      'userEmail': email,
      'userLocation': location,
      'isUserVerified': verified,
      'isUserReferred': referralUsed,
      //form2
      'userHeight': height,
      'userWeight': weight,
      'userBMIScore': bmi,
      'userBMIStringResult': bmiStringResult,
      'userFitnessLevel': fitnessLevelName,

      //form3
      'userDailyTimeGoal': dailyExerciseMinutes,
      'userDailyKcalGoal': dailyKcalBurn,

      //form4
      'weeklyWorkoutPlan': weeklyWorkoutPlan,

      'userBio': bio,
      'userJoiningDate': joiningDate,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      profileImageUrl: map['userProfileImageUrl'],
      uid: map['uid'],
      name: map['userFullName'],
      username: map['userName'],
      gender: map['userGender'],
      dob: map['userDOB'] != null
          ? (map['userDOB'] as Timestamp).toDate()
          : null,
      email: map['userEmail'],
      location: map['userLocation'],
      verified: map['isUserVerified'],
      referralUsed: map['isUserReferred'],
      height: map['userHeight']?.toDouble(),
      weight: map['userWeight']?.toDouble(),
      bmi: map['userBMIScore']?.toDouble(),
      bmiStringResult: map['userBMIStringResult'],
      fitnessLevelName: map['userFitnessLevel'],
      dailyExerciseMinutes: map['userDailyTimeGoal'],
      dailyKcalBurn: map['userDailyKcalGoal'],
      weeklyWorkoutPlan: (map['weeklyWorkoutPlan'] as Map<String, dynamic>?)
          ?.map((key, value) => MapEntry(key, List<String>.from(value))),
      bio: map['userBio'],
      joiningDate: map['userJoiningDate'] != null
          ? (map['userJoiningDate'] as Timestamp).toDate()
          : null,
    );
  }

  void prepareForSaving({required String uid}) {
    this.uid = uid;
    joiningDate ??= DateTime.now();
    verified ??= true;
    referralUsed ??= false;
  }

  void reset() {
    name = null;
    username = null;
    email = null;
    gender = null;
    dob = null;
    location = null;
    bio = null;
    profileImageUrl = null;
    joiningDate = null;
  }
}
