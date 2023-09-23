class ProductModel {
  String? name;
  String? category;
  double? price;

  ProductModel({this.category, this.name, this.price});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "category": category,
      "price": price,
    };
  }
}
