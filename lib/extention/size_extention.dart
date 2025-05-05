import 'package:flutter/material.dart';

extension SizedBoxExtention on num {
  SizedBox get wBox => SizedBox(width: toDouble());
  SizedBox get hBox => SizedBox(height: toDouble());
}