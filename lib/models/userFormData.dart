import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  //Form1
  String? profileImageUrl;
  String? uid;
  String? name;
  String? username;
  String? gender;
  DateTime? dob;
  String? email;
  String? location;
  bool? verified;
  bool? referralUsed;

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
  DateTime? joiningDate;

  UserModel({
    //Form1
    this.profileImageUrl,
    this.uid,
    this.name,
    this.username,
    this.gender,
    this.dob,
    this.email,
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
      profileImageUrl: map['profileImageUrl'],
      uid: map['uid'],
      name: map['fullName'],
      username: map['userName'],
      gender: map['gender'],
      dob: map['dob'] != null ? (map['dob'] as Timestamp).toDate() : null,
      email: map['email'],
      location: map['location'],
      verified: map['isVerified'],
      referralUsed: map['isReferred'],
      height: map['height']?.toDouble(),
      weight: map['weight']?.toDouble(),
      bmi: map['bmi']?.toDouble(),
      weeklyWorkoutPlan: (map['weeklyWorkoutPlan'] as Map<String, dynamic>?)
          ?.map((key, value) => MapEntry(key, List<String>.from(value))),
      bio: map['bio'],
      joiningDate: map['joiningDate'] != null
          ? (map['joiningDate'] as Timestamp).toDate()
          : null,
    );
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
