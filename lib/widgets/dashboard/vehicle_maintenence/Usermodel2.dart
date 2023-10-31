// ignore_for_file: file_names

import 'dart:convert';

User userFromJson(String str) => User.fromJson(jsonDecode(str));

class User {
  User(
      {this.fleet,
      this.harshbreaking,
      this.excessiveidling,
      this.harshacceleration,
      this.towing,
      this.batterytamper});

  int? fleet;
  int? harshbreaking;
  int? excessiveidling;
  int? harshacceleration;
  int? towing;
  int? batterytamper;

  factory User.fromJson(Map<String, dynamic> json) => User(
      fleet: json['Fleet'],
      harshbreaking: json['Harsh breaking'],
      excessiveidling: json['Excessive idling'],
      harshacceleration: json['Harsh acceleration'],
      towing: json['Towing'],
      batterytamper: json['Battery tamper']);
}