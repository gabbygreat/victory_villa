import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:victory_villa/model/model.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://victoryvilla.herokuapp.com';
// const String baseUrl = 'http://10.0.2.2:8000';

class PostCalls {
  static Future<bool?> addHotelOccupant(RoomInfo roomInfo) async {
    Uri addHotelOccupantUrl = Uri.parse('$baseUrl/api/rooms/${roomInfo.id}');
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
        final response = jsonDecode(sendRequest.body);
        if (response['flag']) {
          return true;
        } else {
          return false;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<bool?> addExpense(ExpenseModel expense) async {
    Uri addExpenseUrl = Uri.parse('$baseUrl/api/expense');
    Map<String, dynamic> jsonifiedExpense = expense.toJson();
    final encodedData = jsonEncode(jsonifiedExpense);
    try {
      final sendRequest = await http.post(
        addExpenseUrl,
        body: encodedData,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (sendRequest.statusCode == 200) {
        final response = jsonDecode(sendRequest.body);
        if (response['flag']) {
          return true;
        } else {
          return false;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}

Map<String, dynamic> mockExpenseData = {
  "flag": true,
  "expense": [
    {
      "detailOfPayment": "paid for nepa bill",
      "expenseType": "utility",
      // "filePath": "assets/file.png",
      "amount": 120000,
      "date": "2020-07-16T23:46:09.319974",
    },
    {
      "detailOfPayment": "paid for nepa bill2",
      "expenseType": "utility",
      // "filePath": "assets/file.png",
      "amount": 150000,
      "date": "2020-07-16T23:46:09.319974",
    },
    {
      "detailOfPayment": "nepa bill for month of september",
      "expenseType": "utility",
      // "filePath": "assets/file.png",
      "amount": 21000,
      "date": "2020-07-16T23:46:09.319974",
    },
    {
      "detailOfPayment": "paid workers first salary",
      "expenseType": "management",
      // "filePath": "assets/file.png",
      "amount": 300000,
      "date": "2020-07-16T23:46:09.319974",
    },
  ]
};

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
    {"roomNumber": "A004", "id": 4, "occupied": false},
  ]
};

class GetCalls {
  static Future<Map<String, List>?> getFinancialStatus() async {
    Uri getAllExpenses = Uri.parse('$baseUrl/api/expense');

    try {
      final sendRequest = await http.get(getAllExpenses);

      if (sendRequest.statusCode == 200) {
        final List responseList = jsonDecode(sendRequest.body)['data'] as List;
        List<ExpenseModel> expenseList = [];
        expenseList =
            responseList.map((e) => ExpenseModel.fromJson(e)).toList();

        List<RoomInfo>? allRooms = await GetCalls.getAllRooms();
        List<RoomInfo> income = [];
        if (allRooms == null) return null;
        for (RoomInfo roomInfo in allRooms) {
          if (roomInfo.occupied == true) {
            income.add(roomInfo);
          }
        }
        return {
          'income': income,
          'expense': expenseList,
        };
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<List<RoomInfo>?> getAllRooms() async {
    Uri getAllRoomsUri = Uri.parse('$baseUrl/api/rooms');

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
