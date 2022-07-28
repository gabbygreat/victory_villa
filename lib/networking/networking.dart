import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:victory_villa/model/model.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://10.0.2.2:8000/api';

class PostCalls {
  static Future<bool?> addHotelOccupant(RoomInfo roomInfo) async {
    Uri addHotelOccupantUrl = Uri.parse('$baseUrl/roominfo');

    Map<String, dynamic> jsonifiedRoomInfo = roomInfo.toJson();
    final encodedData = jsonEncode(jsonifiedRoomInfo);
    try {
      final sendRequest = await http.post(
        addHotelOccupantUrl,
        body: encodedData,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (sendRequest.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return null;
    }
  }
}

class GetCalls {
  static Future<List<RoomInfo>?> getAllRooms() async {
    Uri getAllRoomsUri = Uri.parse('$baseUrl/roominfo');

    try {
      final sendRequest = await http.get(getAllRoomsUri);

      if (sendRequest.statusCode == 200) {
        final List responseList = jsonDecode(sendRequest.body)['data'] as List;
        List<RoomInfo> roomInfoList =
            responseList.map((e) => RoomInfo.fromJson(e)).toList();

        return roomInfoList;
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<List<RoomInfo>?> searchForAllRoom({String? searchText}) async {
    List<RoomInfo>? allRooms = await getAllRooms();
    List<RoomInfo> searchInfo = [];
    if (allRooms == null) return null;
    if (searchText == null) return allRooms;
    for (RoomInfo roomInfo in allRooms) {
      if (roomInfo.roomNumber.contains(searchText)) {
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
