import 'dart:math';
import 'dart:ui';
double _compatRate=0.0;

double getCompatRate() {
  _compatRate = window.physicalSize.width / 375 / window.devicePixelRatio;
  return _compatRate;
}

double compat(double value, {double maxRate = 1.2}) {
  return value * min(getCompatRate(), maxRate);
}