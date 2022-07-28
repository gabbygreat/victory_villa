import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:victory_villa/model/enum.dart';
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/screen/search/view/search.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';
import 'package:victory_villa/utils/widget/text_field.dart';

import '../../../screen/search/controller/search_controller.dart';

class SearchBox extends ConsumerStatefulWidget {
  final ValueChanged<String>? onSearch;
  final bool enabled;
  final List<RoomInfo>? roomInfoList;

  const SearchBox(
      {Key? key, this.onSearch, this.enabled = true, this.roomInfoList})
      : super(key: key);

  @override
  ConsumerState<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends ConsumerState<SearchBox> {
  String searchText = 'Suite Number';
  IconData choiceIcon = Icons.door_front_door;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(VictoryConstants.kPadding),
      child: GestureDetector(
        onTap: () {
          if (widget.enabled == false) {
            final List<RoomInfo> replica = widget.roomInfoList!.toList();
            ref.read(searchRoomProvider.state).state = replica;
            ref.read(searchRoomTextProvider.state).state = '';
            ref.read(searchCategoryProvider.state).state = SearchCategory.suite;
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SearchRoom(
                  roomInfoList: replica,
                ),
              ),
            );
          }
        },
        behavior: HitTestBehavior.opaque,
        child: Row(
          children: [
            Flexible(
              flex: 5,
              child: TextField(
                decoration: customInputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hint:
                      'Search ${widget.enabled ? "By " + searchText : "For Room"}',
                ),
                enabled: widget.enabled,
                onChanged: (text) {
                  if (widget.onSearch != null) {
                    widget.onSearch!(text);
                  }
                },
              ),
            ),
            if (widget.enabled == true)
              SizedBox(
                width: VictoryConstants.kSpacing * 0.5,
              ),
            if (widget.enabled == true)
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
                          ref.read(searchCategoryProvider.state).state =
                              SearchCategory.name;
                          break;
                        case 'room':
                          searchText = 'Room Number';
                          choiceIcon = Icons.pin;
                          ref.read(searchCategoryProvider.state).state =
                              SearchCategory.room;
                          break;
                        case 'suite':
                          searchText = 'Suite Number';
                          choiceIcon = Icons.door_front_door;
                          ref.read(searchCategoryProvider.state).state =
                              SearchCategory.suite;
                          break;
                        default:
                      }
                    });
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
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
      ),
    );
  }
}
