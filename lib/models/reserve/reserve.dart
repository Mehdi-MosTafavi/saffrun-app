class Reserve {
  int id;
  int adminId;
  String adminName;
  DateTime createdReserve;
  DateTime targetStartReserve;
  DateTime targetEndReserve;
  String description;

  Reserve(
      {required this.id,
      required this.adminId,
      required this.adminName,
      required this.createdReserve,
      this.description = "",
      required this.targetStartReserve,
      required this.targetEndReserve});

  static List<Reserve> reserve = [
    Reserve(
        id: 1,
        adminId: 1,
        adminName: 'کافه رخ',
        createdReserve: DateTime(2020, 11, 7, 14, 0),
        targetStartReserve: DateTime(2021, 11, 7, 15, 15),
        targetEndReserve: DateTime(2021, 11, 7, 15, 30)),
    Reserve(
        id: 1,
        adminId: 1,
        adminName: 'کافه رخ',
        createdReserve: DateTime(2020, 11, 7, 14, 0),
        targetStartReserve: DateTime(2021, 11, 7, 15, 15),
        targetEndReserve: DateTime(2021, 11, 7, 15, 30)),
    Reserve(
        id: 1,
        adminId: 1,
        adminName: 'کافه رخ',
        createdReserve: DateTime(2020, 11, 7, 14, 0),
        targetStartReserve: DateTime(2021, 11, 7, 15, 15),
        targetEndReserve: DateTime(2021, 11, 7, 15, 30)),
    Reserve(
        id: 1,
        adminId: 1,
        adminName: 'کافه رخ',
        createdReserve: DateTime(2020, 11, 7, 14, 0),
        targetStartReserve: DateTime(2020, 11, 7, 15, 15),
        targetEndReserve: DateTime(2021, 11, 7, 15, 30))
  ];
}
