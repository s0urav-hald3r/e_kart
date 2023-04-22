class ProductModel {
  String? pId;
  String? pName;
  String? pImage;
  double? pAmout;

  ProductModel(
      {required this.pId,
      required this.pName,
      required this.pImage,
      required this.pAmout});

  ProductModel.fromJson(Map<String, dynamic> json) {
    pId = json['pId'];
    pName = json['pName'];
    pImage = json['pImage'];
    pAmout = json['pAmout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pId'] = pId;
    data['pName'] = pName;
    data['pImage'] = pImage;
    data['pAmout'] = pAmout;
    return data;
  }
}
