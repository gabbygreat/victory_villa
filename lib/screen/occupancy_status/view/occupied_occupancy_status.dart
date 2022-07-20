import 'package:flutter/material.dart';
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/screen/room_details/room_details.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/widget/app_bar.dart';

class OccupiedOccupancyStatus extends StatelessWidget {
  final List<RoomInfo> availableroomInfo;
  const OccupiedOccupancyStatus({Key? key, required this.availableroomInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final replica = availableroomInfo.toList();
    replica.removeWhere((room) => room.occupied == false);
    return Scaffold(
      appBar: customAppBar(title: 'Available rooms'),
      body: ListView(
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
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RoomDetails(
                            roomInfo: roomInfo,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Text(roomInfo.roomNumber),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RoomDetails(
                            roomInfo: roomInfo,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Icon(
                          Icons.check_circle,
                          color: VictoryColor.green,
                        ),
                      ),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RoomDetails(
                            roomInfo: roomInfo,
                          ),
                        ),
                      ),
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
