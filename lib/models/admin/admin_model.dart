class Admin {
  late int _id;
  late String _name;
  late String _description;
  late String _category;
  late List<String> _imageUrls;
  late int _followers;
  late int _following;
  late List<String> _comments;
  late List<String> _events;
  late String _rate;

  Admin(
      int id,
      String name,
      String description,
      String category,
      List<String> imageUrls,
      int followers,
      int following,
      List<String> comments,
      List<String> events,
      String rate) {
    _id = id;
    _name = name;
    _description = description;
    _category = category;
    _imageUrls = imageUrls;
    _followers = followers;
    _following = following;
    _comments = comments;
    _events = events;
    _rate = rate;
  }

  int getId() {
    return _id;
  }

  String getName() {
    return _name;
  }

  String getDescription() {
    return _description;
  }

  String getCategory() {
    return _category;
  }

  List<String> getImageUrls() {
    return _imageUrls;
  }

  int getFollowers() {
    return _followers;
  }

  int getFollowing() {
    return _following;
  }

  List<String> getComments() {
    return _comments;
  }

  List<String> getEvents() {
    return _events;
  }

  String getRate() {
    return _rate;
  }

  static List<Admin> admins = <Admin>[
    Admin(
        1,
        'امیر مهدی ایکانی',
        'ایشون ادم بسیار فهمیده ای هستن',
        'دسته بندی',
        [
          'https://www.iberdrola.com/wcorp/gc/prod/en_US/comunicacion/polinizacion_natural_mult_1_res/Polinizacion_1_746x419.jpg'
        ],
        20,
        20,
        [''],
        [''],
        '3.5'),
  ];
}
