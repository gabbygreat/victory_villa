import 'package:flutter/material.dart';
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/utils/constants.dart';
import 'package:victory_villa/utils/show_toast.dart';
import 'package:victory_villa/utils/widget/app_bar.dart';

class UnavailableOccupancyStatus extends StatelessWidget {
  final List<RoomInfo> unavailableroomInfo;
  const UnavailableOccupancyStatus(
      {Key? key, required this.unavailableroomInfo})
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
            columns: const [
              DataColumn(
                  label: Text('Room',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Suite',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Status',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ],
            rows: replica.map(
              (RoomInfo roomInfo) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(roomInfo.id.toString()),
                      onTap: () => showToast('Room is currently unoccupied'),
                    ),
                    DataCell(
                      Text(roomInfo.roomNumber),
                      onTap: () => showToast('Room is currently unoccupied'),
                    ),
                    DataCell(
                      Center(
                        child: Icon(
                          Icons.check_circle,
                          color: roomInfo.occupied ? Colors.green : Colors.red,
                        ),
                      ),
                      onTap: () => showToast('Room is currently unoccupied'),
                    ),
                  ],
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
