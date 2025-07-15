import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
// import 'main.dart';

class ResultScreen extends StatelessWidget {
  final double? bmiResult;

  const ResultScreen({super.key, required this.bmiResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Results",
          style: TextStyle(
            fontSize: 25, //
          ),
        ),
        backgroundColor: Color(0xFF0D101F),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Color(0xFF0F101D),
      body: Column(
        children: [
          SizedBox(height: 40),
          //Guage
          SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 41,
                interval: 2,
                labelsPosition: ElementsPosition.outside,
                axisLabelStyle: GaugeTextStyle(
                  color: Colors.white, //
                ),
                showLabels: true,
                canScaleToFit: true,
                radiusFactor: 0.8,
                ranges: <GaugeRange>[
                  GaugeRange(
                    startValue: 0,
                    endValue: 12,
                    color: Colors.red, //
                  ),
                  GaugeRange(
                    startValue: 12,
                    endValue: 18.5,
                    color: Colors.orange, //
                  ),
                  GaugeRange(
                    startValue: 18.5,
                    endValue: 25,
                    color: Colors.green, //
                  ),
                  GaugeRange(
                    startValue: 25,
                    endValue: 30,
                    color: Colors.amber, //
                  ),
                  GaugeRange(
                    startValue: 30,
                    endValue: 35,
                    color: Colors.orange, //
                  ),
                  GaugeRange(
                    startValue: 35,
                    endValue: 41,
                    color: Colors.red, //
                  ),
                ],

                pointers: <GaugePointer>[
                  NeedlePointer(
                    value: bmiResult ?? 0,
                    needleEndWidth: 5,
                    enableAnimation: true, //
                    needleColor: Colors.white,
                    animationDuration: 1500,
                  ),
                ],
              ),
            ],
          ),
          Text(
            "BMI SCORE: ${format(bmiResult)}",
            style: TextStyle(
              fontSize: 30, //
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            categories(bmiResult),
            style: TextStyle(
              fontSize: 30, //
              fontWeight: FontWeight.bold,
              color: chooseColor(bmiResult),
            ),
          ),
          Text(
            message(bmiResult),
            style: TextStyle(
              fontSize: 20, //
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); //
            },
            child: Text('Recalculate results'),
          ),
        ],
      ),
    );
  }

  String message(bmiResult) {
    if (bmiResult <= 18.5) {
      return "Eat something Bro";
    } else if (bmiResult <= 25) {
      return "Alright Keep up homie";
    } else if (bmiResult <= 30) {
      return "You really need to work on a diet plan";
    }
    return "Go to gym fatty";
  }

  String categories(bmiResult) {
    if (bmiResult <= 18.5) {
      return "UnderWeight";
    } else if (bmiResult <= 25) {
      return "Normal";
    } else if (bmiResult <= 30) {
      return "OverWeight";
    }
    return "Obesity";
  }

  Color chooseColor(bmiResult) {
    if (bmiResult <= 18.5) {
      return Colors.orange;
    } else if (bmiResult <= 25) {
      return Colors.green;
    } else if (bmiResult <= 30) {
      return Colors.amber;
    }
    return Colors.red;
  }

  double format(bmiResult) {
    String changeSTR = bmiResult.toStringAsFixed(1);
    double formatted = double.parse(changeSTR);
    return formatted;
  }
}
