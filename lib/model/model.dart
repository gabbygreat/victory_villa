import 'dart:io';

class RoomInfo {
  final int id;
  final String roomNumber;
  final bool occupied;
  final Occupant? occupant;
  final Guarantor? guarantor;
  RoomInfo({
    required this.id,
    required this.roomNumber,
    required this.occupied,
    required this.occupant,
    required this.guarantor,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'occupied': occupied,
        'occupant': occupant == null ? null : occupant!.toJson(),
        'roomNumber': roomNumber,
        'guarantor': guarantor == null ? null : guarantor!.toJson(),
      };

  static RoomInfo fromJson(Map<String, dynamic> roomInfoData) => RoomInfo(
        id: roomInfoData['id'],
        roomNumber: roomInfoData['roomNumber'],
        occupied: roomInfoData['occupied'],
        occupant: roomInfoData['occupant'] != null
            ? Occupant.fromJson(roomInfoData['occupant'])
            : null,
        guarantor: roomInfoData['guarantor'] != null
            ? Guarantor.fromJson(roomInfoData['guarantor'])
            : null,
      );
}

class Occupant {
  final String name;
  final String gender;
  final String phoneNumber;
  final String stateOfOrigin;
  // final DateTime dateOfOccupancy;
  final DateTime dateOfRentPayment;

  Occupant({
    required this.name,
    required this.gender,
    required this.phoneNumber,
    required this.stateOfOrigin,
    // required this.dateOfOccupancy,
    required this.dateOfRentPayment,
  });
  Map<String, dynamic> toJson() => {
        'name': name,
        'gender': gender,
        'phoneNumber': phoneNumber,
        'stateOfOrigin': stateOfOrigin,
        // 'dateOfOccupancy': dateOfOccupancy.toIso8601String(),
        'dateOfRentPayment': dateOfRentPayment.toIso8601String(),
      };

  static Occupant fromJson(Map<String, dynamic> occupantData) => Occupant(
        name: occupantData['name'],
        gender: occupantData['gender'],
        phoneNumber: occupantData['phoneNumber'],
        stateOfOrigin: occupantData['stateOfOrigin'],
        // dateOfOccupancy: DateTime.parse(occupantData['dateOfOccupancy']),
        dateOfRentPayment: DateTime.parse(occupantData['dateOfRentPayment']),
      );
}

class Guarantor {
  final String name;
  final String phoneNumber;

  Guarantor({
    required this.name,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'phoneNumber': phoneNumber,
      };

  static Guarantor fromJson(Map<String, dynamic> guarantorData) => Guarantor(
        name: guarantorData['name'],
        phoneNumber: guarantorData['phoneNumber'],
      );
}

class ExpenseModel {
  final String detailOfPayment;
  final String? filePath;
  final File? file;
  final String expenseType;
  final int amount;
  final DateTime date;

  ExpenseModel({
    required this.detailOfPayment,
    this.filePath,
    this.file,
    required this.expenseType,
    required this.amount,
    required this.date,
  });

  static ExpenseModel fromJson(Map<String, dynamic> data) {
    return ExpenseModel(
        detailOfPayment: data['detailOfPayment'],
        filePath: data['filePath'],
        file: data['file'],
        expenseType: data['expenseType'],
        amount: data['amount'],
        date: DateTime.parse(data['date']));
  }

  Map<String, dynamic> toJson() => {
        'detailOfPayment': detailOfPayment,
        'filePath': filePath,
        'file': file,
        'expenseType': expenseType,
        'amount': amount.toString(),
        'date': date.toIso8601String(),
      };
}
