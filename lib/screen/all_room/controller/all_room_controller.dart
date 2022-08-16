import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/networking/networking.dart';

Map<String, dynamic> mockRoomInfoData = {
  "flag": true,
  "room_details": [
    {
      "guarantor": {"name": "Chukwumalume Ekene", "phoneNumber": 8035039153},
      "roomNumber": "A001",
      "id": 1,
      "occupant": {
        "dateOfOccupancy": "2020-07-16T23:46:09.319974",
        "dateOfRentPayment": "2020-07-16T23:46:09.319974",
        "gender": "male",
        "name": "Oranekwu Gabriel",
        "phoneNumber": 8034339010,
        "stateOfOrigin": "Anambra"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 8052223121},
      "roomNumber": "A002",
      "id": 2,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2022-06-18T23:46:09.319974",
        "gender": "female",
        "name": "Uchenna Ifunanya",
        "phoneNumber": 7080365805,
        "stateOfOrigin": "Imo"
      },
      "occupied": true
    },
    {"roomNumber": "A003", "id": 3, "occupied": false},
    {"roomNumber": "A004", "id": 4, "occupied": false},
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 7034400892},
      "roomNumber": "A005",
      "id": 5,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2021-10-18T23:46:09.319974",
        "gender": "male",
        "name": "Dozie Emeka",
        "phoneNumber": 8035039153,
        "stateOfOrigin": "Abia"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Chukwumalume Ekene", "phoneNumber": 8035039153},
      "roomNumber": "A001",
      "id": 6,
      "occupant": {
        "dateOfOccupancy": "2020-07-16T23:46:09.319974",
        "dateOfRentPayment": "2020-07-16T23:46:09.319974",
        "gender": "male",
        "name": "Oranekwu Gabriel",
        "phoneNumber": 8034339010,
        "stateOfOrigin": "Anambra"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 8052223121},
      "roomNumber": "A002",
      "id": 7,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2022-06-18T23:46:09.319974",
        "gender": "female",
        "name": "Uchenna Ifunanya",
        "phoneNumber": 7080365805,
        "stateOfOrigin": "Imo"
      },
      "occupied": true
    },
    {"roomNumber": "A003", "id": 3, "occupied": false},
    {"roomNumber": "A004", "id": 4, "occupied": false},
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 7034400892},
      "roomNumber": "A005",
      "id": 8,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2021-10-18T23:46:09.319974",
        "gender": "male",
        "name": "Dozie Emeka",
        "phoneNumber": 8035039153,
        "stateOfOrigin": "Abia"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Chukwumalume Ekene", "phoneNumber": 8035039153},
      "roomNumber": "A001",
      "id": 9,
      "occupant": {
        "dateOfOccupancy": "2020-07-16T23:46:09.319974",
        "dateOfRentPayment": "2020-07-16T23:46:09.319974",
        "gender": "male",
        "name": "Oranekwu Gabriel",
        "phoneNumber": 8034339010,
        "stateOfOrigin": "Anambra"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 8052223121},
      "roomNumber": "A002",
      "id": 10,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2022-06-18T23:46:09.319974",
        "gender": "female",
        "name": "Uchenna Ifunanya",
        "phoneNumber": 7080365805,
        "stateOfOrigin": "Imo"
      },
      "occupied": true
    },
    {"roomNumber": "A003", "id": 3, "occupied": false},
    {"roomNumber": "A004", "id": 4, "occupied": false},
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 7034400892},
      "roomNumber": "A005",
      "id": 5,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2021-10-18T23:46:09.319974",
        "gender": "male",
        "name": "Dozie Emeka",
        "phoneNumber": 8035039153,
        "stateOfOrigin": "Abia"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Chukwumalume Ekene", "phoneNumber": 8035039153},
      "roomNumber": "A001",
      "id": 1,
      "occupant": {
        "dateOfOccupancy": "2020-07-16T23:46:09.319974",
        "dateOfRentPayment": "2020-07-16T23:46:09.319974",
        "gender": "male",
        "name": "Oranekwu Gabriel",
        "phoneNumber": 8034339010,
        "stateOfOrigin": "Anambra"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 8052223121},
      "roomNumber": "A002",
      "id": 2,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2022-06-18T23:46:09.319974",
        "gender": "female",
        "name": "Uchenna Ifunanya",
        "phoneNumber": 7080365805,
        "stateOfOrigin": "Imo"
      },
      "occupied": true
    },
    {"roomNumber": "A003", "id": 3, "occupied": false},
    {"roomNumber": "A004", "id": 4, "occupied": false},
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 7034400892},
      "roomNumber": "A005",
      "id": 5,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2021-10-18T23:46:09.319974",
        "gender": "male",
        "name": "Dozie Emeka",
        "phoneNumber": 8035039153,
        "stateOfOrigin": "Abia"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Chukwumalume Ekene", "phoneNumber": 8035039153},
      "roomNumber": "A001",
      "id": 1,
      "occupant": {
        "dateOfOccupancy": "2020-07-16T23:46:09.319974",
        "dateOfRentPayment": "2020-07-16T23:46:09.319974",
        "gender": "male",
        "name": "Oranekwu Gabriel",
        "phoneNumber": 8034339010,
        "stateOfOrigin": "Anambra"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 8052223121},
      "roomNumber": "A002",
      "id": 2,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2022-06-18T23:46:09.319974",
        "gender": "female",
        "name": "Uchenna Ifunanya",
        "phoneNumber": 7080365805,
        "stateOfOrigin": "Imo"
      },
      "occupied": true
    },
    {"roomNumber": "A003", "id": 3, "occupied": false},
    {"roomNumber": "A004", "id": 4, "occupied": false},
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 7034400892},
      "roomNumber": "A005",
      "id": 5,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2021-10-18T23:46:09.319974",
        "gender": "male",
        "name": "Dozie Emeka",
        "phoneNumber": 8035039153,
        "stateOfOrigin": "Abia"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Chukwumalume Ekene", "phoneNumber": 8035039153},
      "roomNumber": "A001",
      "id": 1,
      "occupant": {
        "dateOfOccupancy": "2020-07-16T23:46:09.319974",
        "dateOfRentPayment": "2020-07-16T23:46:09.319974",
        "gender": "male",
        "name": "Oranekwu Gabriel",
        "phoneNumber": 8034339010,
        "stateOfOrigin": "Anambra"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 8052223121},
      "roomNumber": "A002",
      "id": 2,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2022-06-18T23:46:09.319974",
        "gender": "female",
        "name": "Uchenna Ifunanya",
        "phoneNumber": 7080365805,
        "stateOfOrigin": "Imo"
      },
      "occupied": true
    },
    {"roomNumber": "A003", "id": 3, "occupied": false},
    {"roomNumber": "A004", "id": 4, "occupied": false},
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 7034400892},
      "roomNumber": "A005",
      "id": 5,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2021-10-18T23:46:09.319974",
        "gender": "male",
        "name": "Dozie Emeka",
        "phoneNumber": 8035039153,
        "stateOfOrigin": "Abia"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Chukwumalume Ekene", "phoneNumber": 8035039153},
      "roomNumber": "A001",
      "id": 1,
      "occupant": {
        "dateOfOccupancy": "2020-07-16T23:46:09.319974",
        "dateOfRentPayment": "2020-07-16T23:46:09.319974",
        "gender": "male",
        "name": "Oranekwu Gabriel",
        "phoneNumber": 8034339010,
        "stateOfOrigin": "Anambra"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 8052223121},
      "roomNumber": "A002",
      "id": 2,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2022-06-18T23:46:09.319974",
        "gender": "female",
        "name": "Uchenna Ifunanya",
        "phoneNumber": 7080365805,
        "stateOfOrigin": "Imo"
      },
      "occupied": true
    },
    {"roomNumber": "A003", "id": 3, "occupied": false},
    {"roomNumber": "A004", "id": 4, "occupied": false},
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 7034400892},
      "roomNumber": "A005",
      "id": 5,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2021-10-18T23:46:09.319974",
        "gender": "male",
        "name": "Dozie Emeka",
        "phoneNumber": 8035039153,
        "stateOfOrigin": "Abia"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Chukwumalume Ekene", "phoneNumber": 8035039153},
      "roomNumber": "A001",
      "id": 1,
      "occupant": {
        "dateOfOccupancy": "2020-07-16T23:46:09.319974",
        "dateOfRentPayment": "2020-07-16T23:46:09.319974",
        "gender": "male",
        "name": "Oranekwu Gabriel",
        "phoneNumber": 8034339010,
        "stateOfOrigin": "Anambra"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 8052223121},
      "roomNumber": "A002",
      "id": 2,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2022-06-18T23:46:09.319974",
        "gender": "female",
        "name": "Uchenna Ifunanya",
        "phoneNumber": 7080365805,
        "stateOfOrigin": "Imo"
      },
      "occupied": true
    },
    {"roomNumber": "A003", "id": 3, "occupied": false},
    {"roomNumber": "A004", "id": 4, "occupied": false},
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 7034400892},
      "roomNumber": "A005",
      "id": 5,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2021-10-18T23:46:09.319974",
        "gender": "male",
        "name": "Dozie Emeka",
        "phoneNumber": 8035039153,
        "stateOfOrigin": "Abia"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Chukwumalume Ekene", "phoneNumber": 8035039153},
      "roomNumber": "A001",
      "id": 1,
      "occupant": {
        "dateOfOccupancy": "2020-07-16T23:46:09.319974",
        "dateOfRentPayment": "2020-07-16T23:46:09.319974",
        "gender": "male",
        "name": "Oranekwu Gabriel",
        "phoneNumber": 8034339010,
        "stateOfOrigin": "Anambra"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 8052223121},
      "roomNumber": "A002",
      "id": 2,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2022-06-18T23:46:09.319974",
        "gender": "female",
        "name": "Uchenna Ifunanya",
        "phoneNumber": 7080365805,
        "stateOfOrigin": "Imo"
      },
      "occupied": true
    },
    {"roomNumber": "A003", "id": 3, "occupied": false},
    {"roomNumber": "A004", "id": 4, "occupied": false},
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 7034400892},
      "roomNumber": "A005",
      "id": 5,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2021-10-18T23:46:09.319974",
        "gender": "male",
        "name": "Dozie Emeka",
        "phoneNumber": 8035039153,
        "stateOfOrigin": "Abia"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Chukwumalume Ekene", "phoneNumber": 8035039153},
      "roomNumber": "A001",
      "id": 1,
      "occupant": {
        "dateOfOccupancy": "2020-07-16T23:46:09.319974",
        "dateOfRentPayment": "2020-07-16T23:46:09.319974",
        "gender": "male",
        "name": "Oranekwu Gabriel",
        "phoneNumber": 8034339010,
        "stateOfOrigin": "Anambra"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 8052223121},
      "roomNumber": "A002",
      "id": 2,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2022-06-18T23:46:09.319974",
        "gender": "female",
        "name": "Uchenna Ifunanya",
        "phoneNumber": 7080365805,
        "stateOfOrigin": "Imo"
      },
      "occupied": true
    },
    {"roomNumber": "A003", "id": 3, "occupied": false},
    {"roomNumber": "A004", "id": 4, "occupied": false},
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 7034400892},
      "roomNumber": "A005",
      "id": 5,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2021-10-18T23:46:09.319974",
        "gender": "male",
        "name": "Dozie Emeka",
        "phoneNumber": 8035039153,
        "stateOfOrigin": "Abia"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Chukwumalume Ekene", "phoneNumber": 8035039153},
      "roomNumber": "A001",
      "id": 1,
      "occupant": {
        "dateOfOccupancy": "2020-07-16T23:46:09.319974",
        "dateOfRentPayment": "2020-07-16T23:46:09.319974",
        "gender": "male",
        "name": "Oranekwu Gabriel",
        "phoneNumber": 8034339010,
        "stateOfOrigin": "Anambra"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 8052223121},
      "roomNumber": "A002",
      "id": 2,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2022-06-18T23:46:09.319974",
        "gender": "female",
        "name": "Uchenna Ifunanya",
        "phoneNumber": 7080365805,
        "stateOfOrigin": "Imo"
      },
      "occupied": true
    },
    {"roomNumber": "A003", "id": 3, "occupied": false},
    {"roomNumber": "A004", "id": 4, "occupied": false},
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 7034400892},
      "roomNumber": "A005",
      "id": 5,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2021-10-18T23:46:09.319974",
        "gender": "male",
        "name": "Dozie Emeka",
        "phoneNumber": 8035039153,
        "stateOfOrigin": "Abia"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Chukwumalume Ekene", "phoneNumber": 8035039153},
      "roomNumber": "A001",
      "id": 1,
      "occupant": {
        "dateOfOccupancy": "2020-07-16T23:46:09.319974",
        "dateOfRentPayment": "2020-07-16T23:46:09.319974",
        "gender": "male",
        "name": "Oranekwu Gabriel",
        "phoneNumber": 8034339010,
        "stateOfOrigin": "Anambra"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 7034400892},
      "roomNumber": "A005",
      "id": 5,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2021-10-18T23:46:09.319974",
        "gender": "male",
        "name": "Dozie Emeka",
        "phoneNumber": 8035039153,
        "stateOfOrigin": "Abia"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Chukwumalume Ekene", "phoneNumber": 8035039153},
      "roomNumber": "A001",
      "id": 1,
      "occupant": {
        "dateOfOccupancy": "2020-07-16T23:46:09.319974",
        "dateOfRentPayment": "2020-07-16T23:46:09.319974",
        "gender": "male",
        "name": "Oranekwu Gabriel",
        "phoneNumber": 8034339010,
        "stateOfOrigin": "Anambra"
      },
      "occupied": true
    },
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 8052223121},
      "roomNumber": "A002",
      "id": 2,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2022-06-18T23:46:09.319974",
        "gender": "female",
        "name": "Uchenna Ifunanya",
        "phoneNumber": 7080365805,
        "stateOfOrigin": "Imo"
      },
      "occupied": true
    },
    {"roomNumber": "A003", "id": 3, "occupied": false},
    {"roomNumber": "A004", "id": 4, "occupied": false},
    {
      "guarantor": {"name": "Uchechukwu Rita", "phoneNumber": 7034400892},
      "roomNumber": "A005",
      "id": 5,
      "occupant": {
        "dateOfOccupancy": "2022-06-18T23:46:09.319974",
        "dateOfRentPayment": "2021-10-18T23:46:09.319974",
        "gender": "male",
        "name": "Dozie Emeka",
        "phoneNumber": 8035039153,
        "stateOfOrigin": "Abia"
      },
      "occupied": true
    },
  ]
};

final allRoomProvider = FutureProvider.autoDispose
    .family<List<RoomInfo>?, String?>((_, searchText) async =>
        await GetCalls.searchForAllRoom(searchText: searchText));

