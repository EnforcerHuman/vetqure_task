import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 10,
  );
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = const Text('9-10am', style: style);
      break;
    case 2:
      text = const Text('10-11pm', style: style);
      break;
    case 3:
      text = const Text('11-12pm', style: style);
      break;
    case 4:
      text = const Text('12-1pm', style: style);
      break;
    case 5:
      text = const Text('1-2pm', style: style);
      break;
    case 6:
      text = const Text('2-3pm', style: style);
      break;
    case 7:
      text = const Text('3-4pm', style: style);
      break;
    case 8:
      text = const Text('4-5pm', style: style);
      break;
    case 9:
      text = const Text('5-6pm', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 8.0,
    child: text,
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
  String text;
  switch (value.toInt()) {
    case 10:
      text = '10';
      break;
    case 20:
      text = '20';
      break;
    case 30:
      text = '30';
      break;
    case 40:
      text = '40';
      break;
    case 50:
      text = '50';
      break;
    default:
      return Container();
  }
  return Text(text, style: style, textAlign: TextAlign.center);
}
