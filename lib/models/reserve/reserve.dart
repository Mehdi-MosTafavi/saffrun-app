import 'package:intl/intl.dart';
import 'package:saffrun_app/logical/general/size_function.dart';

import '../../constants/const.dart';

class Reserve {
  int id;
  int adminId;
  String adminName;
  String adminImage;
  DateTime createdReserve;
  DateTime targetStartReserve;
  DateTime targetEndReserve;
  String description;
  String status;
  int price;

  Reserve(
      {required this.id,
      required this.adminId,
      this.adminImage = "",
      required this.adminName,
      required this.createdReserve,
      this.description = "",
      required this.targetStartReserve,
      this.status = "",
      this.price = 0,
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
      reserves.add(Reserve(
          id: element['id'],
          adminId: element['owner']['id'],
          adminName: element['owner']['username'],
          createdReserve: today,
          targetStartReserve:
              DateFormat('HH:mm:ss').parse(element['start_time']),
          targetEndReserve: DateFormat('HH:mm:ss').parse(element['end_time'])));
    });
    return reserves;
  }

  static Reserve fromNearest(Map<String, dynamic> nearest, int adminId) {
    return Reserve(
        id: nearest['reserve_id'],
        adminId: adminId,
        adminName: '',
        price: nearest['price'],
        createdReserve: DateTime.now(),
        targetStartReserve:
            DateFormat('yyyy-MM-ddTHH:mm').parse(nearest['datetime']),
        targetEndReserve: DateTime.now());
  }

  static List<List<Reserve>> fromJsonOfNextSeven(
      List result, int adminId, int nearId) {
    List<List<Reserve>> reserves = [[], [], [], [], [], [], []];
    int index = 0;
    result.forEach((element) {
      element.forEach((element2) {
        if (nearId != element2['reserve_id']) {
          reserves[index].add(fromNearest(element2, adminId));
        }
      });
      index++;
    });
    return reserves;
  }

  static List<Reserve> fromJsonForHistory(List result) {
    List<Reserve> reserves = [];
    for (var element in result) {
      reserves.add(Reserve(
          id: element['id'],
          adminId: element['owner']['id'],
          adminName: element['owner']['title'] ?? " ",
          createdReserve: DateTime(2020, 0, 0),
          price: element['price'],
          status: element['status'],
          adminImage: element['image']['image'] == null
              ? DefaultImage
              : element['image']['image']['full_size'],
          targetStartReserve: getTime(element['start_datetime']),
          targetEndReserve: getTime(element['end_datetime'])));
    }
    return reserves;
  }

  static List<Reserve> fromJsonListHomePage(result) {
    List<Reserve> reserves = [];
    for (var element in result) {
      reserves.add(Reserve(
          id: element['id'],
          adminId: element['ownerId'],
          adminName: element['owner_name'] ?? " ",
          createdReserve: DateTime(2020, 0, 0),
          adminImage: element['picture']['image'] == null
              ? DefaultImage
              : element['picture']['image']['thumbnail'],
          targetStartReserve: getTime(element['start_datetime']),
          targetEndReserve: getTime(element['end_datetime'])));
    }
    return reserves;
  }
}
