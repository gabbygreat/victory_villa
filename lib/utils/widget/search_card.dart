import 'package:flutter/material.dart';
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/screen/room_details/room_details.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';
import 'package:victory_villa/utils/show_toast.dart';

class SearchCard extends StatelessWidget {
  final RoomInfo roomInfo;
  const SearchCard({
    Key? key,
    required this.roomInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: VictoryConstants.kPadding * 0.5,
        vertical: VictoryConstants.kPadding * 0.4,
      ),
      child: InkWell(
        onTap: () {
          if (roomInfo.occupied) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => RoomDetails(roomInfo: roomInfo)),
              ),
            );
          } else {
            showToast('No occupant yet');
          }
        },
        child: Padding(
          padding: EdgeInsets.all(VictoryConstants.kPadding * 0.8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cardInfo(
                leftIcon: Icons.pin,
                text: 'SUITE ${roomInfo.roomNumber}',
                isOccupied: roomInfo.occupied,
                showRightIndicator: true,
              ),
              if (roomInfo.occupant != null)
                cardInfo(
                  leftIcon: Icons.person,
                  text: roomInfo.occupant!.name,
                ),
              if (roomInfo.occupant != null)
                cardInfo(
                  leftIcon: Icons.mood,
                  text: roomInfo.occupant!.gender,
                ),
              if (roomInfo.occupant != null)
                cardInfo(
                  leftIcon: Icons.phone,
                  text: roomInfo.occupant!.phoneNumber,
                ),
              if (roomInfo.occupant != null)
                cardInfo(
                  leftIcon: Icons.supervisor_account,
                  text: roomInfo.guarantor!.name,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget cardInfo(
        {required IconData leftIcon,
        required String text,
        bool? isOccupied,
        bool showRightIndicator = false}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            leftIcon,
            color: VictoryColor.primaryColor,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(
              color: VictoryColor.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (showRightIndicator)
            const Spacer(
              flex: 6,
            ),
          if (showRightIndicator)
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    isOccupied! ? VictoryColor.green : VictoryColor.faintColor,
              ),
            ),
        ],
      ),
    );
