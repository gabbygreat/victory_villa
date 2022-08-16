import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/networking/networking.dart';

final unOccupiedRoomProvider = FutureProvider.autoDispose<List<RoomInfo>?>(
    (_) => GetCalls.searchForAvailableRoom());
