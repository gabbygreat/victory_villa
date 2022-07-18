// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:victory_villa/utils/colors.dart';

InputDecoration customInputDecoration({
  Widget? prefixIcon,
  Widget? suffixIcon,
  String? hint,
  String? hintB,
  bool enabled = true,
}) {
  return InputDecoration(
    focusColor: VictoryColor.primaryColor,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    labelText: hint,
    enabled: enabled,
    hintText: hintB,
    alignLabelWithHint: true,
    fillColor: Colors.grey.withOpacity(.1),
    filled: true,
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(.3),
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(.3),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(.3),
      ),
    ),
  );
}
