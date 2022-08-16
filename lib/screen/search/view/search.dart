import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/screen/search/controller/search_controller.dart';
import 'package:victory_villa/utils/widget/app_bar.dart';
import 'package:victory_villa/utils/widget/search_box/search_box.dart';
import 'package:victory_villa/utils/widget/search_card.dart';

class SearchRoom extends ConsumerStatefulWidget {
  final List<RoomInfo> roomInfoList;

  const SearchRoom({Key? key, required this.roomInfoList}) : super(key: key);

  @override
  ConsumerState<SearchRoom> createState() => _SearchRoomState();
}

class _SearchRoomState extends ConsumerState<SearchRoom> {
  @override
  Widget build(BuildContext context) {
    final search = ref.watch(searchRoomListProvider.state).state;
    return Scaffold(
      appBar: customAppBar(title: 'Search for room'),
      body: Column(children: [
        SearchBox(
          onSearch: (text) {
            ref.read(searchRoomTextProvider.state).state = text;
          },
        ),
        Expanded(
          // child: Center(),
          child: ListView(
            children: search.map((e) => SearchCard(roomInfo: e)).toList(),
          ),
        ),
      ]),
    );
  }
}
