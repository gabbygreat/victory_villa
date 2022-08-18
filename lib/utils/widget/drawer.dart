import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:victory_villa/screen/expense/new_expense.dart';
import 'package:victory_villa/screen/financial_status/view/financial_status.dart';
import 'package:victory_villa/screen/new_occupant/new_occupant.dart';
import 'package:victory_villa/screen/occupancy_status/occupancy_status.dart';
import 'package:victory_villa/screen/tenancy_status/tenancy_status.dart';
import 'package:victory_villa/utils/assets.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: VictoryColor.white,
      width: MediaQuery.of(context).size.width * 0.8,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: VictoryConstants.kPadding,
            bottom: VictoryConstants.kPadding * 0.2,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    SvgPicture.asset(
                      VictoryAssets.icon,
                      width: 100,
                      height: 100,
                      color: VictoryColor.primaryColor,
                    ),
                    SizedBox(
                      height: VictoryConstants.kSpacing,
                    ),
                    Text(
                      VictoryConstants.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: VictoryColor.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.0045 *
                          VictoryConstants.kSpacing,
                    ),
                    DrawerListTile(
                      text: 'Home',
                      icon: Icons.home,
                      onTap: () => Navigator.pop(context),
                    ),
                    DrawerListTile(
                        text: 'New Occupant',
                        icon: Icons.person_add,
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => NewOccupantScreen(),
                            ),
                          );
                        }),
                    DrawerListTile(
                        text: 'New Expense',
                        icon: Icons.move_up,
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const NewExpenseScreen(),
                            ),
                          );
                        }),
                    DrawerListTile(
                        text: 'Occupancy Status',
                        icon: Icons.apartment,
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const OccupancyStatus(),
                            ),
                          );
                        }),
                    DrawerListTile(
                        text: 'Tenancy Status',
                        icon: Icons.grid_view,
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const TenancyStatus(),
                            ),
                          );
                        }),
                    DrawerListTile(
                      text: 'Financial Status',
                      icon: Icons.payments,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const FinancialStatus(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: VictoryConstants.kPadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      VictoryConstants.motto,
                      style: TextStyle(
                        color: VictoryColor.faintColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'gabbygreat © 2022',
                      style: TextStyle(
                        color: VictoryColor.faintColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? onTap;
  const DrawerListTile({
    Key? key,
    required this.text,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18,
              color: VictoryColor.primaryColor,
            ),
          ),
          leading: Icon(
            icon,
            color: VictoryColor.primaryColor,
          ),
          onTap: onTap,
        ),
        const Divider(),
      ],
    );
  }
}
