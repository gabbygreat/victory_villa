import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/screen/all_room/controller/all_room_controller.dart';
import 'package:victory_villa/screen/room_details/room_details.dart';
import 'package:victory_villa/utils/assets.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';
import 'package:victory_villa/utils/widget/app_bar.dart';
import 'package:victory_villa/utils/widget/horizontal_line.dart';
import 'package:victory_villa/utils/widget/piechart.dart';

class TenancyStatus extends ConsumerWidget {
  const TenancyStatus({Key? key}) : super(key: key);

  Color getRentColorIndicator(DateTime date) {
    int daysLeft = DateTime.now().difference(date).inDays;
    if (daysLeft >= 360) {
      return Colors.red;
    } else if (daysLeft >= 240) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<RoomInfo>?> state = ref.watch(allRoomProvider(null));

    return Scaffold(
      appBar: customAppBar(title: 'Tenancy Status'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          state.when(
            data: (value) {
              List<RoomInfo> replicaRow = [];
              double high = 0;
              double middle = 0;
              double low = 0;
              if (value != null) {
                final replica = value.toList();

                replica.removeWhere((room) => room.occupied == false);
                replica.sort(((a, b) => a
                    .occupant!.dateOfRentPayment.millisecondsSinceEpoch
                    .compareTo(
                        b.occupant!.dateOfRentPayment.millisecondsSinceEpoch)));
                for (var roomInfo in replica) {
                  if (DateTime.now()
                          .difference(roomInfo.occupant!.dateOfRentPayment)
                          .inDays >=
                      360) {
                    high++;
                  } else if (DateTime.now()
                          .difference(roomInfo.occupant!.dateOfRentPayment)
                          .inDays >=
                      240) {
                    middle++;
                  } else {
                    low++;
                  }
                }
                replicaRow = replica.toList();
              }

              return Expanded(
                child: value == null
                    ? Padding(
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
                                ref.refresh(allRoomProvider(null));
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
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: VictoryConstants.kSpacing,
                          ),
                          TenancyChart(high: high, low: low, middle: middle),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 15),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Expired Rooms: ${high.toInt()} Rooms',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: VictoryColor.primaryColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'Mid-level Rooms: ${middle.toInt()} Rooms',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: VictoryColor.primaryColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'Safe Rooms: ${low.toInt()} Rooms',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: VictoryColor.primaryColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          horizontalLine(showText: false),
                          Expanded(
                            child: ListView(
                              padding: EdgeInsets.symmetric(
                                  horizontal: VictoryConstants.kPadding * 0.5),
                              children: [
                                DataTable(
                                  columns: [
                                    DataColumn(
                                        label: Text('Suite',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: VictoryColor
                                                    .primaryColor))),
                                    DataColumn(
                                        label: Text('Last Payment',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: VictoryColor
                                                    .primaryColor))),
                                    DataColumn(
                                        label: Text('Status',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: VictoryColor
                                                    .primaryColor))),
                                  ],
                                  rows: replicaRow.map(
                                    (RoomInfo roomInfo) {
                                      return DataRow(
                                        cells: [
                                          DataCell(
                                            Text(
                                              roomInfo.roomNumber,
                                              style: TextStyle(
                                                color:
                                                    VictoryColor.primaryColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            onTap: () =>
                                                Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    RoomDetails(
                                                  roomInfo: roomInfo,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              DateFormat('dd MMM yyyy').format(
                                                  roomInfo.occupant!
                                                      .dateOfRentPayment),
                                              style: TextStyle(
                                                color:
                                                    VictoryColor.primaryColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            onTap: () =>
                                                Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    RoomDetails(
                                                  roomInfo: roomInfo,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: Icon(
                                                Icons.circle,
                                                color: getRentColorIndicator(
                                                    roomInfo.occupant!
                                                        .dateOfRentPayment),
                                              ),
                                            ),
                                            onTap: () =>
                                                Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    RoomDetails(
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
                          ),
                        ],
                      ),
              );
            },
            error: (e, trace) => Expanded(
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
                        ref.refresh(allRoomProvider(null));
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
            ),
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
