import 'package:bmi_flutter/constants/constant.dart';
import 'package:flutter/material.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;
  Color bmiColor = primaryColor;

  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(this.bmi) {}

  double calculateBmi() {
    double heightInMeter = height! / 100;
    final h = heightInMeter * heightInMeter;
    bmi = weight! / h;
    return bmi!;
  }

  String determineBmiCategory() {
    if (bmi! < 16.0) {
      bmiCategory = underweightSevere;
    } else if (bmi! < 17) {
      bmiCategory = underweightModerate;
    } else if (bmi! < 18.5) {
      bmiCategory = underweightMild;
    } else if (bmi! < 25) {
      bmiCategory = normal;
    } else if (bmi! < 30) {
      bmiCategory = overweight;
    } else if (bmi! < 35) {
      bmiCategory = obeseI;
    } else if (bmi! < 40) {
      bmiCategory = obeseII;
    } else if (bmi! >= 40) {
      bmiCategory = obeseIII;
    }

    return bmiCategory!;
  }

  getHealRiskDescription() {
    switch (bmiCategory) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        bmiDescription = 'Possible nutritionals deficiency and osteoporosis.';
        bmiColor = Colors.brown;
        break;
      case normal:
        bmiDescription = 'Low risk (healthy range).';
        bmiColor = Colors.green;
        break;
      case overweight:
        bmiDescription = 'Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.';
        bmiColor = Colors.orange;
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        bmiDescription = 'High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus. Metabolic Syndrome.';
        bmiColor = Colors.red;
        break;
      default:
    }
  }
}