class SubCategoryModel {
  final String id;
  final String category_id;
  final String? title;
  final int? amountProducts;

  SubCategoryModel({required this.id, required this.category_id, this.title, this.amountProducts});

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'],
      category_id: json['category_id'],
      title: json['title']??'Title',
      amountProducts: 15,
    );
  }

}