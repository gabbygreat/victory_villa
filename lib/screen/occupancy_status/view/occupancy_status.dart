import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/screen/all_room/controller/all_room_controller.dart';
import 'package:victory_villa/screen/occupancy_status/view/available_occupancy_status.dart';
import 'package:victory_villa/screen/occupancy_status/view/all_occupancy_status.dart';
import 'package:victory_villa/screen/occupancy_status/view/unavailable_occupancy_status.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';
import 'package:victory_villa/utils/widget/app_bar.dart';
import 'package:victory_villa/utils/widget/horizontal_line.dart';
import 'package:victory_villa/utils/widget/no_network.dart';

class OccupancyStatus extends ConsumerWidget {
  const OccupancyStatus({Key? key}) : super(key: key);

  Widget infoCard(String detail, int count, Function()? onTap) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: VictoryConstants.kPadding,
            horizontal: 15.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                detail,
                style: TextStyle(
                  color: VictoryColor.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                count.toString(),
                style: TextStyle(
                  color: VictoryColor.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<RoomInfo>?> state = ref.watch(allRoomProvider(null));

    return Scaffold(
      appBar: customAppBar(title: 'Occupancy Status'),
      body: Column(
        children: [
          state.when(
            data: (value) {
              int totalRoom = value!.length;
              int occupiedRoom = 0;
              int unoccupiedRoom = 0;
              for (RoomInfo roomInfo in value) {
                if (roomInfo.occupied) {
                  occupiedRoom++;
                } else {
                  unoccupiedRoom++;
                }
              }
              return Padding(
                padding: EdgeInsets.all(VictoryConstants.kPadding),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      horizontalLine(showText: false),
                      Card(
                        elevation: 0,
                        child: Padding(
                          padding: EdgeInsets.all(VictoryConstants.kPadding),
                          child: Text(
                            'All information about the occupant of a room will be shown here',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: VictoryColor.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      horizontalLine(showText: false),
                      infoCard(
                        'All rooms',
                        totalRoom,
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AllOccupancyStatus(
                              roomInfo: value,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: VictoryConstants.kSpacing * 0.6,
                      ),
                      infoCard(
                        'Available rooms',
                        occupiedRoom,
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AvailableOccupancyStatus(
                              availableroomInfo: value,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: VictoryConstants.kSpacing * 0.6,
                      ),
                      infoCard(
                        'Unavailable rooms',
                        unoccupiedRoom,
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => UnavailableOccupancyStatus(
                              unavailableroomInfo: value,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            error: (e, trace) => const NoInternet(),
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
