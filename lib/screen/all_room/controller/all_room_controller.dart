import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/networking/networking.dart';

final allRoomProvider = FutureProvider.autoDispose
    .family<List<RoomInfo>?, String?>((_, searchText) async =>
        await GetCalls.searchForAllRoom(searchText: searchText));

