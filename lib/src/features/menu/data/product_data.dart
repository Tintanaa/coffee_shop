class ProductData {
  final String name;
  final double price;
  final String imageurl;
  final String currency;

  const ProductData({
    required this.name,
    required this.price,
    required this.imageurl,
    required this.currency,
  });

  factory ProductData.fromJSON(Map<String, dynamic> json) {
    return ProductData(
      name: json['name'] as String,
      price: double.parse(json['price'].toString()),
      imageurl: json['imageurl'] as String,
      currency: json['currency'] as String,
    );
  }
}