class SliderData {
  List<SliderModel>? data;

  SliderData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SliderModel>[];
      json['data'].forEach((v) {
        data!.add( SliderModel.fromJson(v));
      });
    }
  }
}

class SliderModel {
  int? id;
  String? media;

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    media = json['media']??'';
  }
}
