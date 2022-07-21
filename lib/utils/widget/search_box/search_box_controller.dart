import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:victory_villa/screen/all_room/controller/all_room_controller.dart';
import 'package:victory_villa/utils/widget/room_detail_selector.dart';
import 'package:victory_villa/utils/widget/text_field.dart';

class SearchBoxController extends StateNotifier<Widget> {
  SearchBoxController()
      : super(RoomDetailSelector(
          searchText: true,
        ));

  changeBox(String type, WidgetRef ref) {
    switch (type) {
      case 'suite':
        state = RoomDetailSelector(
          searchText: true,
        );
        break;
      case 'name':
        state = TextField(
          onChanged: (text) {
            log(text);
            ref.read(allRoomProvider(text));
          },
          decoration: customInputDecoration(
            prefixIcon: const Icon(Icons.search),
            hint: 'Search with name eg. Gabriel',
          ),
        );
        break;
      case 'number':
        state = TextField(
          decoration: customInputDecoration(
            prefixIcon: const Icon(Icons.search),
            hint: 'Search with room number eg. 1',
          ),
        );
        break;
      default:
    }
  }
}

final searchBoxProvider = StateNotifierProvider<SearchBoxController, Widget>(
    (_) => SearchBoxController());
