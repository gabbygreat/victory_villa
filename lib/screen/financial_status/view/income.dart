import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/screen/room_details/room_details.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';
import 'package:victory_villa/utils/function.dart';
import 'package:victory_villa/utils/widget/app_bar.dart';

class Income extends StatelessWidget {
  final List<RoomInfo> roomInfo;
  final double amount;
  const Income({Key? key, required this.roomInfo, required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Income Analysis'),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ANNUAL INCOME: ₦ ${getCurrency(amount)}',
                    style: TextStyle(
                      color: VictoryColor.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '\nA total of ${(amount ~/ VictoryConstants.houseRent)} rooms has paid their rent.\nThe house rent is valued at ${VictoryConstants.houseRent ~/ 1}',
                    style: TextStyle(
                      color: VictoryColor.faintColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: VictoryConstants.kSpacing * 0.5,
              ),
              children: [
                DataTable(
                    border: TableBorder.all(),
                    columns: [
                      DataColumn(
                          label: Text('Room',
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
                    rows: roomInfo.map((RoomInfo e) {
                      return DataRow(
                        cells: [
                          DataCell(
                            Text(
                              'Room ${e.roomNumber}',
                              style: TextStyle(
                                color: VictoryColor.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RoomDetails(
                                  roomInfo: e,
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              DateFormat('dd MMM yyyy')
                                  .format(e.occupant!.dateOfRentPayment),
                              style: TextStyle(
                                color: VictoryColor.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RoomDetails(
                                  roomInfo: e,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
