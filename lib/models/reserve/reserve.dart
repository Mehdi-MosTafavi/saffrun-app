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

  static List<List<Reserve>> reserve = [
    [
      Reserve(
          id: 1,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2021, 11, 7, 15, 15),
          targetEndReserve: DateTime(2021, 11, 7, 15, 30)),
      Reserve(
          id: 2,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2021, 11, 7, 15, 30),
          targetEndReserve: DateTime(2021, 11, 7, 15, 45)),
      Reserve(
          id: 3,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2021, 11, 7, 16, 0),
          targetEndReserve: DateTime(2021, 11, 7, 16, 20)),
      Reserve(
          id: 4,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2020, 11, 7, 16, 20),
          targetEndReserve: DateTime(2021, 11, 7, 16, 40))
    ],
    [
      Reserve(
          id: 5,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2021, 11, 7, 16, 20),
          targetEndReserve: DateTime(2021, 11, 7, 16, 40)),
      Reserve(
          id: 8,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2020, 11, 7, 16, 40),
          targetEndReserve: DateTime(2021, 11, 7, 17, 0))
    ],
    [
      Reserve(
          id: 9,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2021, 11, 7, 16, 40),
          targetEndReserve: DateTime(2021, 11, 7, 17, 0)),
      Reserve(
          id: 10,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2021, 11, 7, 17, 0),
          targetEndReserve: DateTime(2021, 11, 7, 17, 20)),
      Reserve(
          id: 11,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2021, 11, 7, 17, 20),
          targetEndReserve: DateTime(2021, 11, 7, 17, 40)),
      Reserve(
          id: 12,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2020, 11, 7, 17, 40),
          targetEndReserve: DateTime(2021, 11, 7, 18, 0))
    ],
    [
      Reserve(
          id: 13,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2021, 11, 7, 15, 15),
          targetEndReserve: DateTime(2021, 11, 7, 15, 30)),
      Reserve(
          id: 14,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2021, 11, 7, 15, 15),
          targetEndReserve: DateTime(2021, 11, 7, 15, 30)),
      Reserve(
          id: 15,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2021, 11, 7, 15, 15),
          targetEndReserve: DateTime(2021, 11, 7, 15, 30)),
      Reserve(
          id: 16,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2020, 11, 7, 15, 15),
          targetEndReserve: DateTime(2021, 11, 7, 15, 30))
    ],
    [
      Reserve(
          id: 17,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2021, 11, 7, 15, 15),
          targetEndReserve: DateTime(2021, 11, 7, 15, 30)),
      Reserve(
          id: 18,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2021, 11, 7, 15, 15),
          targetEndReserve: DateTime(2021, 11, 7, 15, 30)),
      Reserve(
          id: 19,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2021, 11, 7, 15, 15),
          targetEndReserve: DateTime(2021, 11, 7, 15, 30)),
      Reserve(
          id: 20,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2020, 11, 7, 15, 15),
          targetEndReserve: DateTime(2021, 11, 7, 15, 30))
    ],
    [
      Reserve(
          id: 21,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2021, 11, 7, 15, 15),
          targetEndReserve: DateTime(2021, 11, 7, 15, 30)),
      Reserve(
          id: 22,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2021, 11, 7, 15, 15),
          targetEndReserve: DateTime(2021, 11, 7, 15, 30)),
      Reserve(
          id: 23,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2021, 11, 7, 15, 15),
          targetEndReserve: DateTime(2021, 11, 7, 15, 30)),
      Reserve(
          id: 24,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2020, 11, 7, 15, 15),
          targetEndReserve: DateTime(2021, 11, 7, 15, 30))
    ],
    [
      Reserve(
          id: 25,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2021, 11, 7, 15, 15),
          targetEndReserve: DateTime(2021, 11, 7, 15, 30)),
      Reserve(
          id: 26,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2021, 11, 7, 15, 15),
          targetEndReserve: DateTime(2021, 11, 7, 15, 30)),
      Reserve(
          id: 27,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2021, 11, 7, 15, 15),
          targetEndReserve: DateTime(2021, 11, 7, 15, 30)),
      Reserve(
          id: 28,
          adminId: 1,
          adminName: 'مهندس هلاکویی',
          createdReserve: DateTime(2020, 11, 7, 14, 0),
          targetStartReserve: DateTime(2020, 11, 7, 15, 15),
          targetEndReserve: DateTime(2021, 11, 7, 15, 30))
    ],
  ];

  static fromJson(List response, DateTime today) {
    List<Reserve> reserves = [];
    response.forEach((element) {
      List listTimesStart = (element['start_time'] as String).split(':');
      List listTimesEnd = (element['end_time'] as String).split(':');
      reserves.add(Reserve(
          id: element['id'],
          adminId: element['owner']['id'],
          adminName: element['owner']['username'],
          createdReserve: today,
          targetStartReserve: DateTime(2020, 0, 0, int.parse(listTimesStart[0]),
              int.parse(listTimesStart[1]), int.parse(listTimesStart[2])),
          targetEndReserve: DateTime(2020, 0, 0, int.parse(listTimesEnd[0]),
              int.parse(listTimesEnd[1]), int.parse(listTimesEnd[2]))));
    });
    return reserves;
  }
}
