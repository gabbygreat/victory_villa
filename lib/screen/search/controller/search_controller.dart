import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:victory_villa/model/enum.dart';
import 'package:victory_villa/model/model.dart';

final searchRoomProvider = StateProvider<List<RoomInfo>>((_) => []);

final searchRoomTextProvider = StateProvider<String>((_) => '');

final searchCategoryProvider =
    StateProvider<SearchCategory>((_) => SearchCategory.suite);

final searchRoomListProvider = StateProvider<List<RoomInfo>>((ref) {
  final searchRoomText = ref.watch(searchRoomTextProvider);
  final searchRoom = ref.watch(searchRoomProvider.state).state;
  final searchCategory = ref.watch(searchCategoryProvider.state).state;

  List<RoomInfo> searchResult = [];
  if (searchRoomText.isEmpty) {
    searchResult = searchRoom;
  } else {
    switch (searchCategory) {
      case SearchCategory.suite:
        searchResult = searchRoom
            .where((element) => element.roomNumber
                .toLowerCase()
                .contains(searchRoomText.toLowerCase()))
            .toList();
        break;
      case SearchCategory.room:
        searchResult = searchRoom
            .where((element) => element.id.toString() == searchRoomText)
            .toList();
        break;
      case SearchCategory.name:
        List<RoomInfo> nameSearch = [];
        for (RoomInfo element in searchRoom) {
          if (element.occupied) {
            nameSearch.add(element);
          }
        }
        searchResult = nameSearch.where((RoomInfo element) {
          return (element.occupant!.name
                  .toLowerCase()
                  .contains(searchRoomText.toLowerCase()) ||
              element.guarantor!.name
                  .toLowerCase()
                  .contains(searchRoomText.toLowerCase()));
        }).toList();
        break;
      default:
    }
  }

  return searchResult;
});
