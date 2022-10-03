import 'package:flutter/material.dart';
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/screen/edit_occupant/edit_occupant.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';
import 'package:victory_villa/utils/function.dart';
import 'package:victory_villa/utils/widget/app_bar.dart';
import 'package:victory_villa/utils/widget/custom_button.dart';
import 'package:victory_villa/utils/widget/search_card.dart';
import 'package:intl/intl.dart';
import 'package:victory_villa/model/enum.dart' as enums;

class RoomDetails extends StatelessWidget {
  final RoomInfo roomInfo;
  const RoomDetails({Key? key, required this.roomInfo}) : super(key: key);

  Color getRentColorIndicator() {
    DateTime rentPaidDate = roomInfo.occupant!.dateOfRentPayment;

    int daysLeft = DateTime.now().difference(rentPaidDate).inDays;
    if (daysLeft >= 360) {
      return Colors.red;
    } else if (daysLeft >= 240) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: roomInfo.roomNumber),
      body: ListView(
        padding: EdgeInsets.all(VictoryConstants.kPadding),
        children: [
          roomDetailInfo(
            heading: 'Occupant Information',
            type: 'occupant',
            infoCards: [
              cardInfo(
                leftIcon: Icons.person,
                text: roomInfo.occupant!.name,
              ),
              cardInfo(
                leftIcon: Icons.mood,
                text: roomInfo.occupant!.gender,
              ),
              cardInfo(
                leftIcon: Icons.phone,
                text:
                    roomInfo.occupant!.phoneNumber,
              ),
              cardInfo(
                leftIcon: Icons.location_searching,
                text: roomInfo.occupant!.stateOfOrigin,
              ),
              cardInfo(
                leftIcon: Icons.payments,
                text: DateFormat('EEEE, dd MMMM yyyy').format(
                  roomInfo.occupant!.dateOfRentPayment,
                ),
              ),
            ],
          ),
          roomDetailInfo(
            heading: 'Guarantor Information',
            type: 'guarantor',
            infoCards: [
              cardInfo(
                leftIcon: Icons.supervisor_account,
                text: roomInfo.guarantor!.name,
              ),
              cardInfo(
                leftIcon: Icons.phone,
                text:
                    roomInfo.guarantor!.phoneNumber.toString(),
              ),
            ],
          ),
          roomDetailInfo(
            heading: 'Room Information',
            type: 'room',
            infoCards: [
              cardInfo(
                leftIcon: Icons.explore,
                text: getRoomDetailFromSuite(roomInfo.roomNumber)[0],
              ),
              cardInfo(
                leftIcon: Icons.bento,
                text: getRoomDetailFromSuite(roomInfo.roomNumber)[1],
              ),
              cardInfo(
                leftIcon: Icons.door_front_door,
                text: getRoomDetailFromSuite(roomInfo.roomNumber)[2],
              ),
            ],
          ),
          CustomButton(
            'Edit ${roomInfo.roomNumber}',
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditOccupantScreen(
                  roomInfo: roomInfo,
                  gender: roomInfo.occupant!.gender == 'male'
                      ? enums.Gender.male
                      : enums.Gender.female,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget roomDetailInfo(
          {required String heading,
          String? type,
          required List<Widget> infoCards}) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: VictoryConstants.kSpacing),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: VictoryColor.primaryColor,
                  width: 3,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Card(
                margin: EdgeInsets.symmetric(
                  vertical: VictoryConstants.kSpacing * 0.9,
                  horizontal: VictoryConstants.kSpacing,
                ),
                elevation: 0,
                color: Colors.transparent,
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...infoCards,
                      if (type == 'occupant')
                        SizedBox(
                          height: VictoryConstants.kSpacing,
                        ),
                      if (type == 'occupant')
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red == getRentColorIndicator()
                                    ? Colors.red
                                    : VictoryColor.faintColor,
                              ),
                            ),
                            SizedBox(
                              width: VictoryConstants.kSpacing,
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orange == getRentColorIndicator()
                                    ? Colors.orange
                                    : VictoryColor.faintColor,
                              ),
                            ),
                            SizedBox(
                              width: VictoryConstants.kSpacing,
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green == getRentColorIndicator()
                                    ? Colors.green
                                    : VictoryColor.faintColor,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              '$heading ',
              style: TextStyle(
                height: 0.5,
                backgroundColor: VictoryColor.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: VictoryColor.faintColor,
              ),
            ),
          ],
        ),
      );
}
