class NewsCategoryModel {
  int? timestamp;
  List<Categories>? categories;

  NewsCategoryModel({this.timestamp, this.categories});

  NewsCategoryModel.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }
}

class Categories {
  String? name;
  String? file;

  Categories({this.name, this.file});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    file = json['file'];
  }
}
