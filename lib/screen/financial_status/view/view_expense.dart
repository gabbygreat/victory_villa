import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/utils/constants.dart';
import 'package:victory_villa/utils/widget/app_bar.dart';

class ViewExpenseScreen extends StatelessWidget {
  final ExpenseModel expenses;
  const ViewExpenseScreen({Key? key, required this.expenses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'View Expense'),
      body: ListView(
        padding: EdgeInsets.all(VictoryConstants.kPadding),
        children: [
          Text(expenses.detailOfPayment),
          Text(expenses.expenseType),
          // if (expenses.filePath != null) Image.asset(expenses.filePath!),
          Text(expenses.amount.toString()),
          Text(DateFormat('dd MMM yyyy').format(expenses.date)),
        ],
      ),
    );
  }
}
