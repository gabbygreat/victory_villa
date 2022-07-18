import 'package:flutter/material.dart';
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/screen/all_room/controller/all_room_controller.dart';

const String baseUrl = '';

class PostCalls {
  static Future<bool> addHotelOccupant(RoomInfo roomInfo) async {
    Map<String, dynamic> jsonifiedRoomInfo = roomInfo.toJson();
    debugPrint(jsonifiedRoomInfo.toString());
    return true;
  }
}

class GetCalls {
  static Future<List<RoomInfo>?> getAllRooms() async {
    await Future.delayed(const Duration(seconds: 1));
    final responseList =
        mockRoomInfoData['room_details'] as List<Map<String, dynamic>>;
    List<RoomInfo> roomInfoList = [];
    roomInfoList = responseList.map((e) => RoomInfo.fromJson(e)).toList();

    return roomInfoList;
  }

  static Future<List<RoomInfo>?> searchForAllRoom(
      {String searchText = '', String type = 'suite'}) async {
    List<RoomInfo>? allRooms = await getAllRooms();
    List<RoomInfo> searchInfo = [];
    if (allRooms == null) return null;
    for (RoomInfo roomInfo in allRooms) {
      if (roomInfo.roomNumber.contains(searchText) == true) {
        debugPrint('This : ${roomInfo.toJson()}');
        searchInfo.add(roomInfo);
      }
    }
    return searchInfo;
  }

  static Future<List<RoomInfo>?> searchForAvailableRoom() async {
    List<RoomInfo>? allRooms = await GetCalls.getAllRooms();
    List<RoomInfo> availableRooms = [];
    if (allRooms == null) return null;
    for (RoomInfo roomInfo in allRooms) {
      if (roomInfo.occupied == false) {
        availableRooms.add(roomInfo);
      }
    }
    return availableRooms;
  }

  static Future<List<RoomInfo>?> searchForUnavailableRoom() async {
    List<RoomInfo>? allRooms = await GetCalls.getAllRooms();
    List<RoomInfo> unavailableRooms = [];
    if (allRooms == null) return null;
    for (RoomInfo roomInfo in allRooms) {
      if (roomInfo.occupied == true) {
        unavailableRooms.add(roomInfo);
      }
    }
    return unavailableRooms;
  }

  static Future<List<RoomInfo>?> searchForRoomExpiry() async {
    List<RoomInfo>? allRooms = await GetCalls.getAllRooms();
    List<RoomInfo> timeSortedRooms = [];
    if (allRooms == null) return null;
    for (RoomInfo roomInfo in allRooms) {
      if (roomInfo.occupied == true) {
        timeSortedRooms.add(roomInfo);
      }
    }

    timeSortedRooms.sort(((a, b) => a
        .occupant!.dateOfRentPayment.millisecondsSinceEpoch
        .compareTo(b.occupant!.dateOfRentPayment.millisecondsSinceEpoch)));
    
    return timeSortedRooms;
  }
}
