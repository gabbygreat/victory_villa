import 'package:flutter/material.dart';
import 'package:victory_villa/model/enum.dart' as enums;
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';
import 'package:victory_villa/utils/widget/text_field.dart';

class RoomSuite {
  static String roomSuite = '';
  static TextEditingController roomController = TextEditingController();
  static TextEditingController wingController =
      TextEditingController(text: 'Wing');
  static TextEditingController floorController =
      TextEditingController(text: 'Floor');
  static TextEditingController occupantNameController = TextEditingController();
  static TextEditingController occupantPhoneController =
      TextEditingController();
  static TextEditingController stateOfOriginController =
      TextEditingController();
  static TextEditingController guarantorNameController =
      TextEditingController();
  static TextEditingController guarantorPhoneController =
      TextEditingController();

  static dispose() {
    roomSuite = '';
    roomController.text = '';
    floorController.text = 'Floor';
    wingController.text = 'Wing';
    occupantNameController.text = '';
    occupantPhoneController.text = '';
    stateOfOriginController.text = '';
    guarantorNameController.text = '';
    guarantorPhoneController.text = '';
  }
}

// ignore: must_be_immutable
class RoomDetailSelector extends StatefulWidget {
  final bool searchText;
  final Function()? perform;
  String wingIndicator;
  String floorIndicator;
  String roomIndicator;
  RoomDetailSelector({
    Key? key,
    this.searchText = false,
    this.perform,
    this.wingIndicator = '•',
    this.floorIndicator = '•',
    this.roomIndicator = '••',
  }) : super(key: key);

  @override
  State<RoomDetailSelector> createState() => _RoomDetailSelectorState();
}

class _RoomDetailSelectorState extends State<RoomDetailSelector> {
  enums.Wing choiceWing = enums.Wing.none;
  enums.Floor choiceFloor = enums.Floor.none;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                height: 40,
                child: PopupMenuButton<enums.Wing>(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onSelected: (enums.Wing item) {
                    if ((item == enums.Wing.wingC &&
                            (int.tryParse(widget.roomIndicator) == 3 ||
                                (int.tryParse(widget.roomIndicator) == 5 ||
                                    int.tryParse(widget.roomIndicator) == 6 ||
                                    int.tryParse(widget.roomIndicator) == 7 ||
                                    int.tryParse(widget.roomIndicator) == 8 ||
                                    int.tryParse(widget.roomIndicator) ==
                                        9))) ||
                        (item == enums.Wing.wingA &&
                            int.tryParse(widget.roomIndicator) == 9)) {
                    } else {
                      setState(() {
                        switch (item.index) {
                          case 0:
                            RoomSuite.wingController.text = 'Wing A';
                            break;
                          case 1:
                            RoomSuite.wingController.text = 'Wing B';
                            break;
                          case 2:
                            RoomSuite.wingController.text = 'Wing C';
                            break;
                          default:
                        }
                        choiceWing = item;
                        widget.wingIndicator =
                            RoomSuite.wingController.text.substring(5);
                      });
                    }
                    RoomSuite.roomSuite = widget.wingIndicator +
                        widget.floorIndicator +
                        widget.roomIndicator;
                    if (widget.perform != null) {
                      widget.perform!();
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<enums.Wing>>[
                    PopupMenuItem<enums.Wing>(
                      value: enums.Wing.wingA,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Wing A',
                        style: TextStyle(color: VictoryColor.primaryColor),
                      ),
                    ),
                    PopupMenuItem(
                      value: enums.Wing.wingB,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Wing B',
                        style: TextStyle(color: VictoryColor.primaryColor),
                      ),
                    ),
                    PopupMenuItem(
                      value: enums.Wing.wingC,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Wing C',
                        style: TextStyle(color: VictoryColor.primaryColor),
                      ),
                    ),
                  ],
                  child: TextField(
                    controller: RoomSuite.wingController,
                    style:
                        TextStyle(color: VictoryColor.faintColor, fontSize: 13),
                    decoration: customInputDecoration(
                      suffixIcon: const Icon(Icons.arrow_drop_down),
                      enabled: false,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: VictoryConstants.kSpacing * 0.6,
            ),
            Expanded(
              flex: 3,
              child: SizedBox(
                height: 40,
                child: PopupMenuButton<enums.Floor>(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onSelected: (enums.Floor item) {
                    setState(() {
                      switch (item.index) {
                        case 0:
                          RoomSuite.floorController.text = 'Ground';
                          widget.floorIndicator = '0';
                          break;
                        case 1:
                          RoomSuite.floorController.text = 'First';
                          widget.floorIndicator = '1';
                          break;
                        case 2:
                          RoomSuite.floorController.text = 'Second';
                          widget.floorIndicator = '2';
                          break;
                        default:
                      }
                      choiceFloor = item;
                      RoomSuite.roomSuite = widget.wingIndicator +
                          widget.floorIndicator +
                          widget.roomIndicator;
                      if (widget.perform != null) {
                        widget.perform!();
                      }
                    });
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<enums.Floor>>[
                    PopupMenuItem<enums.Floor>(
                      value: enums.Floor.floor1,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Ground Floor',
                        style: TextStyle(color: VictoryColor.primaryColor),
                      ),
                    ),
                    PopupMenuItem(
                      value: enums.Floor.floor2,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'First Floor',
                        style: TextStyle(color: VictoryColor.primaryColor),
                      ),
                    ),
                    PopupMenuItem(
                      value: enums.Floor.floor3,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Second Floor',
                        style: TextStyle(color: VictoryColor.primaryColor),
                      ),
                    ),
                  ],
                  child: TextField(
                    controller: RoomSuite.floorController,
                    style:
                        TextStyle(color: VictoryColor.faintColor, fontSize: 13),
                    decoration: customInputDecoration(
                      suffixIcon: const Icon(Icons.arrow_drop_down),
                      enabled: false,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: VictoryConstants.kSpacing * 0.6,
            ),
            Expanded(
              flex: 2,
              child: PopupMenuButton<int>(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onSelected: (int item) {
                  setState(() {
                    RoomSuite.roomController.text = item.toString();
                    widget.roomIndicator = item.toString().padLeft(2, '0');
                    RoomSuite.roomSuite = widget.wingIndicator +
                        widget.floorIndicator +
                        widget.roomIndicator;
                    if (widget.perform != null) {
                      widget.perform!();
                    }
                  });
                  RoomSuite.roomSuite = widget.wingIndicator +
                      widget.floorIndicator +
                      widget.roomIndicator;
                },
                itemBuilder: (BuildContext context) {
                  int popupLength = 0;
                  switch (choiceWing) {
                    case enums.Wing.wingA:
                      popupLength = 8;
                      break;
                    case enums.Wing.wingB:
                      popupLength = 9;
                      break;
                    case enums.Wing.wingC:
                      popupLength = 5;
                      break;
                    default:
                      popupLength = 0;
                  }
                  List<int> popupList =
                      List<int>.generate(popupLength, (i) => i + 1);
                  if (choiceWing == enums.Wing.wingC) {
                    popupList.remove(3);
                  }

                  return popupList
                      .map((e) => PopupMenuItem<int>(
                            value: e,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Room $e',
                              style:
                                  TextStyle(color: VictoryColor.primaryColor),
                            ),
                          ))
                      .toList();
                },
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: RoomSuite.roomController,
                    style:
                        TextStyle(color: VictoryColor.faintColor, fontSize: 13),
                    decoration: customInputDecoration(
                      suffixIcon: const Icon(Icons.arrow_drop_down),
                      enabled: false,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: VictoryConstants.kSpacing,
        ),
        Text(
          '${widget.searchText ? "SEARCH FOR : " : ""}SUITE ${widget.wingIndicator + widget.floorIndicator + widget.roomIndicator}',
          style: TextStyle(
            color: VictoryColor.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )
      ],
    );
  }
}
