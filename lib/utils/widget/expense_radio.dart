import 'package:flutter/material.dart';
import 'package:victory_villa/model/enum.dart' as enums;
import 'package:victory_villa/utils/colors.dart';

class ExpenseRadio extends StatefulWidget {
  final enums.ExpenseType radioValue;
  final ValueChanged valueChanged;
  const ExpenseRadio({
    Key? key,
    required this.radioValue,
    required this.valueChanged,
  }) : super(key: key);

  @override
  State<ExpenseRadio> createState() => _ExpenseRadioState();
}

class _ExpenseRadioState extends State<ExpenseRadio> {
  enums.ExpenseType _expenseValue = enums.ExpenseType.utility;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Radio<enums.ExpenseType>(
                value: enums.ExpenseType.utility,
                groupValue: _expenseValue,
                onChanged: (value) {
                  setState(
                    () {
                      _expenseValue = value!;
                      widget.valueChanged(value);
                    },
                  );
                },
              ),
              GestureDetector(
                onTap: () => setState(
                  () {
                    _expenseValue = enums.ExpenseType.utility;
                    widget.valueChanged(enums.ExpenseType.utility);
                  },
                ),
                child: Text(
                  'Utility',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: VictoryColor.faintColor,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Radio<enums.ExpenseType>(
                value: enums.ExpenseType.maintenance,
                groupValue: _expenseValue,
                onChanged: (value) {
                  setState(
                    () {
                      _expenseValue = value!;
                      widget.valueChanged(value);
                    },
                  );
                },
              ),
              GestureDetector(
                onTap: () => setState(
                  () {
                    _expenseValue = enums.ExpenseType.maintenance;
                    widget.valueChanged(enums.ExpenseType.maintenance);
                  },
                ),
                child: Text(
                  'Maintenace',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: VictoryColor.faintColor,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Radio<enums.ExpenseType>(
                value: enums.ExpenseType.management,
                groupValue: _expenseValue,
                onChanged: (value) {
                  setState(
                    () {
                      _expenseValue = value!;
                      widget.valueChanged(value);
                    },
                  );
                },
              ),
              GestureDetector(
                onTap: () => setState(
                  () {
                    _expenseValue = enums.ExpenseType.management;
                    widget.valueChanged(enums.ExpenseType.management);
                  },
                ),
                child: Text(
                  'Management',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: VictoryColor.faintColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
