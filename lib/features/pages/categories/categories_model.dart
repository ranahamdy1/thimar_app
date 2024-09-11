class CategoriesData {
  List<CategoriesModel>? data;

  CategoriesData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(CategoriesModel.fromJson(v));
      });
    }
  }

}

class CategoriesModel {
  int? id;
  String? name;
  String? description;
  String? media;

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    media = json['media'];
  }

}