import 'package:flutter/material.dart';
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';
import 'package:victory_villa/utils/show_toast.dart';
import 'package:victory_villa/utils/widget/app_bar.dart';

class UnoccupiedOccupancyStatus extends StatelessWidget {
  final List<RoomInfo> unavailableroomInfo;
  const UnoccupiedOccupancyStatus({Key? key, required this.unavailableroomInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final replica = unavailableroomInfo.toList();
    replica.removeWhere((room) => room.occupied == true);
    return Scaffold(
      appBar: customAppBar(title: 'Unavailable rooms'),
      body: ListView(
        padding: EdgeInsets.all(VictoryConstants.kPadding),
        children: [
          DataTable(
            columns:  [
              DataColumn(
                  label: Text('Room',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold, color: VictoryColor.primaryColor))),
              DataColumn(
                  label: Text('Suite',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold, color: VictoryColor.primaryColor))),
              DataColumn(
                  label: Text('Status',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold, color: VictoryColor.primaryColor))),
            ],
            rows: replica
                .map(
                  (RoomInfo roomInfo) => DataRow(
                    cells: [
                      DataCell(
                        Text(roomInfo.id.toString(),
                          style: TextStyle(
                            color: VictoryColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),),
                        onTap: () => showToast('Room is currently unoccupied'),
                      ),
                      DataCell(
                        Text(roomInfo.roomNumber,
                          style: TextStyle(
                            color: VictoryColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),),
                        onTap: () => showToast('Room is currently unoccupied'),
                      ),
                      DataCell(
                        Center(
                          child: Icon(
                            Icons.check_circle,
                            color: VictoryColor.faintColor,
                          ),
                        ),
                        onTap: () => showToast('Room is currently unoccupied'),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
