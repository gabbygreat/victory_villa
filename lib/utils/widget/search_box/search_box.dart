import 'package:flutter/material.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';
import 'package:victory_villa/utils/widget/text_field.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  String searchText = 'Room Number';
  IconData choiceIcon = Icons.pin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(VictoryConstants.kPadding),
      child: Row(
        children: [
          Flexible(
            flex: 5,
            child: TextField(
              decoration: customInputDecoration(
                prefixIcon: const Icon(Icons.search),
                hint: 'Search by $searchText',
              ),
            ),
          ),
          SizedBox(
            width: VictoryConstants.kSpacing * 0.5,
          ),
          Flexible(
            child: PopupMenuButton<String>(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              onSelected: (String item) {
                setState(() {
                  switch (item) {
                    case 'name':
                      searchText = 'Occupant Name';
                      choiceIcon = Icons.person;
                      break;
                    case 'room':
                      searchText = 'Room Number';
                      choiceIcon = Icons.pin;
                      break;
                    case 'suite':
                      searchText = 'Suite Number';
                      choiceIcon = Icons.door_front_door;
                      break;
                    default:
                  }
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'room',
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Room number',
                    style: TextStyle(color: VictoryColor.primaryColor),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'name',
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Occupant Name',
                    style: TextStyle(color: VictoryColor.primaryColor),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'suite',
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Suite Number',
                    style: TextStyle(color: VictoryColor.primaryColor),
                  ),
                ),
              ],
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                  borderRadius: BorderRadius.circular(4),
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey.withOpacity(.3),
                    ),
                    bottom: BorderSide(
                      color: Colors.grey.withOpacity(.3),
                    ),
                    left: BorderSide(
                      color: Colors.grey.withOpacity(.3),
                    ),
                    right: BorderSide(
                      color: Colors.grey.withOpacity(.3),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(choiceIcon, color: Colors.grey.withOpacity(.9)),
                    Icon(Icons.arrow_drop_down,
                        color: Colors.grey.withOpacity(.9)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
