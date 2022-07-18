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
