import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:victory_villa/screen/financial_status/view/financial_status.dart';
import 'package:victory_villa/screen/tenancy_status/tenancy_status.dart';
import 'package:victory_villa/screen/unoccupied_room/view/unoccupied_room.dart';
import 'package:victory_villa/screen/date_expiry_room/view/date_expiry_room.dart';
import 'package:victory_villa/screen/all_room/view/all_room.dart';
import 'package:victory_villa/screen/occupied_room/view/occupied_room.dart';
import 'package:victory_villa/utils/assets.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';
import 'package:victory_villa/utils/widget/app_bar.dart';
import 'package:victory_villa/utils/widget/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: VictoryConstants.name),
      backgroundColor: const Color.fromARGB(255, 215, 219, 236),
      drawer: const CustomDrawer(),
      // backgroundColor: const Color.fromARGB(235, 229, 227, 227),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8, right: 8),
            height: 60,
            decoration: BoxDecoration(
              color: VictoryColor.primaryColor,
            ),
            // child: Row(
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const Text(
            //       'Logged In: Supervisor',
            //       textAlign: TextAlign.end,
            //       style: TextStyle(
            //         fontFamily: 'Cairo',
            //         color: Colors.white,
            //         fontSize: 18,
            //         fontWeight: FontWeight.bold,
            //         letterSpacing: 0.5,
            //       ),
            //     ),
            //     Icon(
            //       Icons.person,
            //       color: VictoryColor.white,
            //     ),
            //   ],
            // ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.only(
                top: VictoryConstants.kPadding * 2,
                left: VictoryConstants.kPadding * 0.6,
                right: VictoryConstants.kPadding * 0.6,
              ),
              crossAxisSpacing: VictoryConstants.kSpacing * 0.3,
              mainAxisSpacing: VictoryConstants.kSpacing * 0.3,
              children: [
                HomeCard(
                  assetName: VictoryAssets.house,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TenancyStatus(),
                    ),
                  ),
                ),
                HomeCard(
                  assetName: VictoryAssets.naira,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FinancialStatus(),
                    ),
                  ),
                ),
                HomeCard(
                  assetName: VictoryAssets.room,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AllRoom(),
                    ),
                  ),
                ),
                HomeCard(
                  assetName: VictoryAssets.availableRoom,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const UnoccupiedRoom(),
                    ),
                  ),
                ),
                HomeCard(
                  assetName: VictoryAssets.unavailableRoom,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const UnavailableRoom(),
                    ),
                  ),
                ),
                HomeCard(
                  assetName: VictoryAssets.calendar,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DateExpiryRoom(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  final String assetName;
  final Function()? onTap;
  const HomeCard({
    Key? key,
    required this.assetName,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(VictoryConstants.kPadding * 3),
            child: SvgPicture.asset(
              assetName,
              color: VictoryColor.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
