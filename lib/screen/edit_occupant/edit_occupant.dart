import 'package:flutter/material.dart';
import 'package:victory_villa/model/enum.dart' as enums;
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/networking/networking.dart';
import 'package:victory_villa/utils/constants.dart';
import 'package:victory_villa/utils/room_number.dart';
import 'package:victory_villa/utils/show_toast.dart';
import 'package:victory_villa/utils/widget/app_bar.dart';
import 'package:victory_villa/utils/widget/custom_button.dart';
import 'package:victory_villa/utils/widget/horizontal_line.dart';
import 'package:victory_villa/utils/widget/radio.dart';
import 'package:victory_villa/utils/widget/room_detail_selector.dart';
import 'package:victory_villa/utils/widget/text_field.dart';

// ignore: must_be_immutable
class EditOccupantScreen extends StatelessWidget {
  EditOccupantScreen({Key? key, required this.roomInfo, required this.gender})
      : super(key: key);
  final RoomInfo roomInfo;
  enums.Gender gender;
  FocusNode focusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  collectInfo({
    required String occupantName,
    required String occupantPhone,
    required String stateOfOrigin,
    required String gender,
    required String guarantorName,
    required String guarantorPhone,
  }) {
    int _occupantPhone = int.parse(occupantPhone);
    int _guarantorPhone = int.parse(guarantorPhone);
    String _suiteNumber = RoomSuite.roomSuite;

    Occupant occupant = Occupant(
      name: occupantName,
      gender: gender,
      phoneNumber: _occupantPhone,
      stateOfOrigin: stateOfOrigin,
      // dateOfOccupancy: DateTime.now(),
      dateOfRentPayment: DateTime.now(),
    );

    Guarantor guarantor = Guarantor(
      name: guarantorName,
      phoneNumber: _guarantorPhone,
    );

    RoomInfo roomInfo = RoomInfo(
      roomNumber: _suiteNumber,
      id: roomNumberFromSuite(_suiteNumber),
      occupied: true,
      occupant: occupant,
      guarantor: guarantor,
    );

    PostCalls.addHotelOccupant(roomInfo);
  }

  Future<bool> onWillPop() async {
    RoomSuite.dispose();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: customAppBar(title: 'Edit occupant details'),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(
              VictoryConstants.kPadding,
            ),
            children: [
              horizontalLine(text: 'Occupant Details'),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: RoomSuite.occupantNameController,
                decoration: customInputDecoration(
                  hint: roomInfo.occupant!.name,
                  prefixIcon: const Icon(Icons.person),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  } else if (!value.contains(' ')) {
                    return 'Must be a full name. eg. Oko john';
                  }

                  return null;
                },
                // onSaved: (val) => setState(() => _user.firstName = val),
              ),
              SizedBox(
                height: VictoryConstants.kSpacing * 0.5,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                controller: RoomSuite.occupantPhoneController,
                decoration: customInputDecoration(
                  hint: roomInfo.occupant!.phoneNumber
                      .toString()
                      .padLeft(11, '0'),
                  prefixIcon: const Icon(Icons.phone),
                ),
                maxLength: 11,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  } else if (int.tryParse(value) == null ||
                      value.length != 11) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: VictoryConstants.kSpacing * 0.5,
              ),
              TextFormField(
                textInputAction: TextInputAction.done,
                controller: RoomSuite.stateOfOriginController,
                decoration: customInputDecoration(
                  hint: roomInfo.occupant!.stateOfOrigin,
                  prefixIcon: const Icon(Icons.location_pin),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter state of origin';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: VictoryConstants.kSpacing * 0.5,
              ),
              GenderRadio(
                radioValue: gender,
                valueChanged: (value) {
                  gender = value;
                },
              ),
              SizedBox(
                height: VictoryConstants.kSpacing,
              ),
              horizontalLine(text: 'Guarantor Details'),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: RoomSuite.guarantorNameController,
                decoration: customInputDecoration(
                  hint: roomInfo.guarantor!.name,
                  prefixIcon: const Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter guarantor\'s name';
                  } else if (!value.contains(' ')) {
                    return 'Must be a full name. eg. Oko john';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: VictoryConstants.kSpacing * 0.5,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                focusNode: focusNode,
                controller: RoomSuite.guarantorPhoneController,
                textInputAction: TextInputAction.unspecified,
                onEditingComplete: () => focusNode.unfocus(),
                decoration: customInputDecoration(
                  hint: roomInfo.guarantor!.phoneNumber
                      .toString()
                      .padLeft(11, '0'),
                  prefixIcon: const Icon(Icons.phone),
                ),
                maxLength: 11,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter guarantor\'s phone number';
                  } else if (int.tryParse(value) == null ||
                      value.length != 11) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: VictoryConstants.kSpacing,
              ),
              horizontalLine(text: 'Room Details'),
              RoomDetailSelector(
                wingIndicator: roomInfo.roomNumber.substring(0, 1),
                floorIndicator: roomInfo.roomNumber.substring(1, 2),
                roomIndicator: roomInfo.roomNumber.substring(2, 4),
              ),
              SizedBox(
                height: VictoryConstants.kSpacing * 2.5,
              ),
              CustomButton(
                'Save Data',
                onTap: () {
                  final form = _formKey.currentState;
                  if (form != null && form.validate()) {
                    if (RoomSuite.roomSuite.contains('•') ||
                        RoomSuite.roomSuite.isEmpty) {
                      showToast('Choose a correct room number');
                    } else {
                      form.save();
                      collectInfo(
                        occupantName: RoomSuite.occupantNameController.text,
                        occupantPhone: RoomSuite.occupantPhoneController.text,
                        stateOfOrigin: RoomSuite.stateOfOriginController.text,
                        gender: gender == enums.Gender.male ? 'male' : 'female',
                        guarantorName: RoomSuite.guarantorNameController.text,
                        guarantorPhone: RoomSuite.guarantorPhoneController.text,
                      );
                    }
                  } else {
                    showToast('Wrong data');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
