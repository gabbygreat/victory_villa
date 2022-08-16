import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/screen/financial_status/view/view_expense.dart';
import 'package:victory_villa/utils/assets.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';
import 'package:victory_villa/utils/function.dart';
import 'package:victory_villa/utils/widget/app_bar.dart';

class Expense extends StatelessWidget {
  final List<ExpenseModel> expense;
  final double amount;
  const Expense({Key? key, required this.expense, required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Iterable<ExpenseModel> utilityIterable = expense
        .where((ExpenseModel element) => element.expenseType == 'utility');
    Iterable<ExpenseModel> managementIterable = expense
        .where((ExpenseModel element) => element.expenseType == 'management');
    Iterable<ExpenseModel> maintenanceIterable = expense
        .where((ExpenseModel element) => element.expenseType == 'maintenance');

    int utiltyAmount = 0;
    for (var element in utilityIterable) {
      utiltyAmount += element.amount;
    }
    int managementAmount = 0;
    for (var element in managementIterable) {
      managementAmount += element.amount;
    }
    int maintenanceAmount = 0;
    for (var element in maintenanceIterable) {
      maintenanceAmount += element.amount;
    }

    return Scaffold(
      appBar: customAppBar(title: 'Expense Analysis'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            margin: EdgeInsets.symmetric(
              vertical: VictoryConstants.kSpacing,
              horizontal: VictoryConstants.kSpacing * 0.5,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: VictoryConstants.kSpacing,
                horizontal: VictoryConstants.kSpacing * 0.5,
              ),
              child: Text(
                'ANNUAL EXPENSE: ₦ ${getCurrency(amount)}',
                style: TextStyle(
                  color: VictoryColor.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ExpansionTile(
                  childrenPadding: const EdgeInsets.symmetric(horizontal: 10),
                  expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                  title: Text(
                    'Utility Bills',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: VictoryColor.primaryColor,
                    ),
                  ),
                  subtitle: Text(
                    'Total Expense: ₦ ${(getCurrency(utiltyAmount))}',
                  ),
                  children: <Widget>[
                    utilityIterable.isNotEmpty
                        ? DataTable(
                            border: TableBorder.all(),
                            columns: [
                              DataColumn(
                                  label: Text('Amount',
                                      overflow: TextOverflow.visible,
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: VictoryColor.primaryColor))),
                              DataColumn(
                                label: Text('Date of Payment',
                                    overflow: TextOverflow.visible,
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: VictoryColor.primaryColor)),
                              ),
                            ],
                            rows: utilityIterable
                                .toList()
                                .map(
                                  (ExpenseModel e) => DataRow(
                                    cells: [
                                      DataCell(
                                        Text(
                                          '₦ ${getCurrency(e.amount)}',
                                          style: TextStyle(
                                            color: VictoryColor.primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ViewExpenseScreen(expenses: e),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          DateFormat('dd MMM yyyy')
                                              .format(e.date),
                                          style: TextStyle(
                                            color: VictoryColor.primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ViewExpenseScreen(expenses: e),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          )
                        : Center(
                            child: Column(children: [
                              SvgPicture.asset(VictoryAssets.naira),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: VictoryConstants.kSpacing),
                                child: Text(
                                  'There are no expense in this category yet!',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: VictoryColor.faintColor),
                                ),
                              )
                            ]),
                          ),
                  ],
                ),
                ExpansionTile(
                  childrenPadding: const EdgeInsets.symmetric(horizontal: 10),
                  expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                  title: Text(
                    'Management Fee',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: VictoryColor.primaryColor,
                    ),
                  ),
                  subtitle: Text(
                    'Total Expense: ₦ ${(getCurrency(managementAmount))}',
                  ),
                  children: <Widget>[
                    managementIterable.isNotEmpty
                        ? DataTable(
                            border: TableBorder.all(),
                            columns: [
                              DataColumn(
                                  label: Text('Amount',
                                      overflow: TextOverflow.visible,
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: VictoryColor.primaryColor))),
                              DataColumn(
                                label: Text('Date of Payment',
                                    overflow: TextOverflow.visible,
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: VictoryColor.primaryColor)),
                              ),
                            ],
                            rows: managementIterable
                                .toList()
                                .map(
                                  (ExpenseModel e) => DataRow(
                                    cells: [
                                      DataCell(
                                        Text(
                                          '₦ ${getCurrency(e.amount)}',
                                          style: TextStyle(
                                            color: VictoryColor.primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ViewExpenseScreen(expenses: e),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          DateFormat('dd MMM yyyy')
                                              .format(e.date),
                                          style: TextStyle(
                                            color: VictoryColor.primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ViewExpenseScreen(expenses: e),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          )
                        : Center(
                            child: Column(children: [
                              SvgPicture.asset(VictoryAssets.naira),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: VictoryConstants.kSpacing),
                                child: Text(
                                  'There are no expense in this category yet!',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: VictoryColor.faintColor),
                                ),
                              )
                            ]),
                          ),
                  ],
                ),
                ExpansionTile(
                  childrenPadding: const EdgeInsets.symmetric(horizontal: 10),
                  expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                  title: Text(
                    'Maintenance Cost',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: VictoryColor.primaryColor,
                    ),
                  ),
                  subtitle: Text(
                    'Total Expense: ₦ ${(getCurrency(maintenanceAmount))}',
                  ),
                  children: <Widget>[
                    maintenanceIterable.isNotEmpty
                        ? DataTable(
                            border: TableBorder.all(),
                            columns: [
                              DataColumn(
                                  label: Text('Amount',
                                      overflow: TextOverflow.visible,
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: VictoryColor.primaryColor))),
                              DataColumn(
                                label: Text('Date of Payment',
                                    overflow: TextOverflow.visible,
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: VictoryColor.primaryColor)),
                              ),
                            ],
                            rows: maintenanceIterable
                                .toList()
                                .map(
                                  (ExpenseModel e) => DataRow(
                                    cells: [
                                      DataCell(
                                        Text(
                                          '₦ ${getCurrency(e.amount)}',
                                          style: TextStyle(
                                            color: VictoryColor.primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ViewExpenseScreen(expenses: e),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          DateFormat('dd MMM yyyy')
                                              .format(e.date),
                                          style: TextStyle(
                                            color: VictoryColor.primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ViewExpenseScreen(expenses: e),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          )
                        : Center(
                            child: Column(children: [
                              SvgPicture.asset(VictoryAssets.naira),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: VictoryConstants.kSpacing),
                                child: Text(
                                  'There are no expense in this category yet!',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: VictoryColor.faintColor),
                                ),
                              )
                            ]),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
