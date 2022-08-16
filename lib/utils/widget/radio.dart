import 'package:flutter/material.dart';
import 'package:victory_villa/model/enum.dart' as enums;
import 'package:victory_villa/utils/colors.dart';

class GenderRadio extends StatefulWidget {
  const GenderRadio({
    Key? key,
    required this.radioValue,
    required this.valueChanged,
  }) : super(key: key);

  final enums.Gender radioValue;
  final ValueChanged valueChanged;

  @override
  State<GenderRadio> createState() => _GenderRadioState();
}

class _GenderRadioState extends State<GenderRadio> {
  enums.Gender _radioValue = enums.Gender.male;
  String genderText = 'Male';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Row(
              children: [
                Icon(
                  Icons.boy,
                  color: VictoryColor.faintColor,
                ),
                Radio<enums.Gender>(
                  value: enums.Gender.male,
                  groupValue: _radioValue,
                  onChanged: (enums.Gender? value) {
                    setState(
                      () {
                        _radioValue = value!;
                        widget.valueChanged(value);
                        genderText = 'Male';
                      },
                    );
                  },
                ),
              ],
            ),
            Container(
              width: 20,
              height: 5,
              decoration: BoxDecoration(
                color: VictoryColor.faintColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Row(
              children: [
                Radio<enums.Gender>(
                  value: enums.Gender.female,
                  groupValue: _radioValue,
                  onChanged: (enums.Gender? value) {
                    setState(
                      () {
                        _radioValue = value!;
                        widget.valueChanged(value);
                        genderText = 'Female';
                      },
                    );
                  },
                ),
                Icon(
                  Icons.girl,
                  color: VictoryColor.faintColor,
                ),
              ],
            ),
          ],
        ),
        Text(
          genderText,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: VictoryColor.faintColor),
        ),
      ],
    );
  }
}
