import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/networking/networking.dart';

final occupiedRoomProvider = FutureProvider.autoDispose<List<RoomInfo>?>(
    (_) => GetCalls.searchForUnavailableRoom());
