import 'package:bmi_calculator/bmi_calculator/colors.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  ResultView({super.key, required this.result});

  final double result;

  @override
  Widget build(BuildContext context) {
    TextStyle style1 = TextStyle(
        color: AppColors.white, fontSize: 33, fontWeight: FontWeight.bold);
    TextStyle style2 = TextStyle(color: AppColors.white, fontSize: 14);

    String getClassification() {
      if (result < 16) {
        return 'Severe Thinness';
      } else if (result >= 18.5 && result < 25) {
        return 'Normal';
      } else if (result >= 25 && result < 30) {
        return 'Overweight';
      } else if (result >= 30 && result < 35) {
        return 'Obese Class I';
      } else if (result >= 35 && result < 40) {
        return 'Obese Class II';
      } else {
        return 'Obese Class III';
      }
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(getClassification(), style: style2),
              Text(result.toStringAsFixed(2), style: style1),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Re-CALCULATE')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
