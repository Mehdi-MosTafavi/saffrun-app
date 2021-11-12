class Admin {
  late int _id;
  late String _name;
  late String _description;
  late String _category;
  late List<String> _imageUrls;
  late List<String> _followers;
  late List<String> _following;
  late List<String> _comments;
  late List<String> _events;
  late String _rate;

  Admin(int id,
      String name,
      String description,
      String category,
      List<String> imageUrls,
      List<String> followers,
      List<String> following,
      List<String> comments,
      List<String> events,
      String rate
      )
  {
    _id=id;
    _name=name;
    _description=description;
    _category=category;
    _imageUrls=imageUrls;
    _followers=followers;
    _following=following;
    _comments=comments;
    _events=events;
    _rate=rate;
  }
  int getId()
  {
    return _id;
  }
  String getName()
  {
    return _name;
  }
  String getDescription()
  {
    return _description;
  }
  String getCategory()
  {
    return _category;
  }
  List<String> getImageUrls()
  {
    return _imageUrls;
  }
  List<String> getFollowers()
  {
    return _followers;
  }
  List<String> getFollowing()
  {
    return _following;
  }
  List<String> getComments()
  {
    return _comments;
  }
  List<String> getEvents()
  {
    return _events;
  }
  String getRate()
  {
    return _rate;
  }

}

