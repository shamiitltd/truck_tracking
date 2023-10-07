import 'dart:convert';
import 'package:flutter/material.dart';

Adnoc adnocFromJson(String str) => Adnoc.fromJson(jsonDecode(str));

class Adnoc {
  Adnoc(
      {this.adnocevents,
      this.overspeedabove140km,
      this.overspeedabove120km,
      this.nightdriving,
      this.desertoverspeed,
      this.seatbeltviolation,
      this.internalroadoverspeed,
      this.blacktopoverspeed});

  int? adnocevents;
  int? overspeedabove140km;
  int? overspeedabove120km;
  int? nightdriving;
  int? desertoverspeed;
  int? seatbeltviolation;
  int? internalroadoverspeed;
  int? blacktopoverspeed;

  factory Adnoc.fromJson(Map<String, dynamic> json) => Adnoc(
      adnocevents: json['ADNOC events'],
      overspeedabove140km: json['Over speed above 140km'],
      overspeedabove120km: json['Over speed above 120km'],
      nightdriving: json['Night driving'],
      desertoverspeed: json['Desert Over Speed'],
      seatbeltviolation: json['Seat belt violation'],
      internalroadoverspeed: json['Internal road overspeed'],
      blacktopoverspeed: json['Black top overspeed']);
}
