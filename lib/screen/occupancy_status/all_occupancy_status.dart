import 'package:flutter/material.dart';
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/screen/room_details/room_details.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';
import 'package:victory_villa/utils/show_toast.dart';
import 'package:victory_villa/utils/widget/app_bar.dart';

class AllOccupancyStatus extends StatelessWidget {
  final List<RoomInfo> roomInfo;
  const AllOccupancyStatus({Key? key, required this.roomInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'All rooms'),
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
            rows: roomInfo.map(
              (RoomInfo roomInfo) {
                return DataRow(
                  cells: [
                    DataCell(
                        Text(
                          roomInfo.id.toString(),
                          style: TextStyle(
                            color: VictoryColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ), onTap: () {
                      if (roomInfo.occupied) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RoomDetails(
                              roomInfo: roomInfo,
                            ),
                          ),
                        );
                      } else {
                        showToast('Room is currently unoccupied');
                      }
                    }),
                    DataCell(
                        Text(
                          roomInfo.roomNumber,
                          style: TextStyle(
                            color: VictoryColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ), onTap: () {
                      if (roomInfo.occupied) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RoomDetails(
                              roomInfo: roomInfo,
                            ),
                          ),
                        );
                      } else {
                        showToast('Room is currently unoccupied');
                      }
                    }),
                    DataCell(
                        Center(
                          child: Icon(
                            Icons.check_circle,
                            color: roomInfo.occupied
                                ? VictoryColor.green
                                : VictoryColor.faintColor,
                          ),
                        ), onTap: () {
                      if (roomInfo.occupied) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RoomDetails(
                              roomInfo: roomInfo,
                            ),
                          ),
                        );
                      } else {
                        showToast('Room is currently unoccupied');
                      }
                    }),
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
