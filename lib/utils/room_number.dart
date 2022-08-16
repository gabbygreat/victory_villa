int roomNumberFromSuite(String suiteId) {
  Map<String, int> rooms = {
    'A001': 1,
    'A002': 2,
    'A003': 3,
    'A004': 4,
    'A005': 5,
    'A006': 6,
    'A007': 7,
    'A008': 8,
    'B001': 9,
    'B002': 10,
    'B003': 11,
    'B004': 12,
    'B005': 13,
    'B006': 14,
    'B007': 15,
    'B008': 16,
    'B009': 17,
    'C001': 18,
    'C002': 19,
    'C004': 20,
    'C005': 21,
    'A101': 22,
    'A102': 23,
    'A103': 24,
    'A104': 25,
    'A105': 26,
    'A106': 27,
    'A107': 28,
    'A108': 29,
    'B101': 30,
    'B102': 31,
    'B103': 32,
    'B104': 33,
    'B105': 34,
    'B106': 35,
    'B107': 36,
    'B108': 37,
    'B109': 38,
    'C101': 39,
    'C102': 40,
    'C104': 41,
    'C105': 42,
    'A201': 43,
    'A202': 44,
    'A203': 45,
    'A204': 46,
    'A205': 47,
    'A206': 48,
    'A207': 49,
    'A208': 50,
    'B201': 51,
    'B202': 52,
    'B203': 53,
    'B204': 54,
    'B205': 55,
    'B206': 56,
    'B207': 57,
    'B208': 58,
    'B209': 59,
    'C201': 60,
    'C202': 61,
    'C204': 62,
    'C205': 63,
  };
  return rooms[suiteId] ?? 0;
}

List<String> getRoomDetailFromSuite(String suite) {
  //A001
  String roomWing = 'Wing ${suite.substring(0, 1)}';
  String roomLevel = suite.substring(1, 2);
  if (roomLevel == '0') {
    roomLevel = 'Ground Floor';
  } else if (roomLevel == '1') {
    roomLevel = 'First Floor';
  } else {
    roomLevel = 'Second Floor';
  }
  String roomId = 'Room ${roomNumberFromSuite(suite).toString()}';
  return [roomWing, roomLevel, roomId];
}
