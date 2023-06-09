// ignore_for_file: no_leading_underscores_for_local_identifiers

class DataModel {
  String? id;
  String? productName;
  String? productImage;
  int? productPrice;

  DataModel({this.id, this.productImage, this.productName, this.productPrice});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    productName = json["productName"];
    productImage = json["productImage"];
    productPrice = json["productPrice"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["productName"] = productName;
    _data["productImage"] = productImage;
    _data["productPrice"] = productPrice;

    return _data;
  }
}
