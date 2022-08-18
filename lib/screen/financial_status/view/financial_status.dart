import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:victory_villa/screen/financial_status/controller/financial_status_controller.dart';
import 'package:victory_villa/screen/financial_status/view/expense.dart';
import 'package:victory_villa/screen/financial_status/view/income.dart';
import 'package:victory_villa/utils/assets.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';
import 'package:victory_villa/utils/function.dart';
import 'package:victory_villa/utils/widget/app_bar.dart';
import 'package:victory_villa/utils/widget/no_network.dart';
import 'package:victory_villa/utils/widget/piechart.dart';

class FinancialStatus extends ConsumerWidget {
  const FinancialStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Map<String, dynamic>?> state =
        ref.watch(financialStatusProvider);
    return Scaffold(
      appBar: customAppBar(title: 'Financial Details'),
      body: Column(
        children: [
          state.when(
            data: (value) {
              double expense = 0;
              double income = 0;
              if (value != null) {
                income = (VictoryConstants.houseRent * value['income']!.length)
                    .toDouble();

                for (var i in value['expense']) {
                  expense += i.amount;
                }
              }

              return value == null
                  ? Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: VictoryConstants.kPadding * 2,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: SvgPicture.asset(VictoryAssets.network),
                            ),
                            GestureDetector(
                              onTap: () {
                                ref.refresh(financialStatusProvider);
                              },
                              child: Text(
                                'RETRY\n',
                                style: TextStyle(
                                  color: VictoryColor.faintColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  decorationStyle: TextDecorationStyle.dashed,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                        left: VictoryConstants.kPadding,
                        top: VictoryConstants.kPadding,
                        right: VictoryConstants.kPadding,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: VictoryConstants.kSpacing * 3,
                          ),
                          FinanceChart(
                            income: income,
                            expenditure: expense,
                          ),
                          SizedBox(
                            height: VictoryConstants.kSpacing * 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Card(
                                  child: InkWell(
                                    onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Income(
                                          roomInfo: value['income'],
                                          amount: income,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          VictoryAssets.income,
                                          width: 100,
                                          height: 100,
                                          color: VictoryColor.green,
                                        ),
                                        Text(
                                          '₦ ${getCurrency(income)}',
                                          style: TextStyle(
                                            color: VictoryColor.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              VictoryConstants.kSpacing * 0.8,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom:
                                                  VictoryConstants.kSpacing),
                                          child: Text(
                                            'Tap to view analysis',
                                            style: TextStyle(
                                              color: VictoryColor.faintColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Card(
                                  child: InkWell(
                                    onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Expense(
                                          expense: value['expense'],
                                          amount: expense,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          VictoryAssets.expense,
                                          width: 100,
                                          height: 100,
                                          color: VictoryColor.red,
                                        ),
                                        Text(
                                          '₦ ${getCurrency(expense)}',
                                          style: TextStyle(
                                            color: VictoryColor.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              VictoryConstants.kSpacing * 0.8,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom:
                                                  VictoryConstants.kSpacing),
                                          child: Text(
                                            'Tap to view analysis',
                                            style: TextStyle(
                                              color: VictoryColor.faintColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
            },
            error: (e, trace) =>  NoInternet(onTap: ()=>ref.refresh(financialStatusProvider),),
            loading: () => const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
