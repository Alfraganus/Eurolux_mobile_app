
class ProductModel {
  final int id;
  final String? title;
  final String? image;
  final String? description;
  final int? price;

  ProductModel({required this.id, required this.title, required this.image, required this.description, required this.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title']??'Title',
      image: json['image'],
      description: json['description'],
      price: json['price'],
    );
  }

}