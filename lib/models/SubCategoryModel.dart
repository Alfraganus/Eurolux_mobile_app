class SubCategoryModel {
  final String? category_id;
  final String? title;
  final String? amountProducts;

  SubCategoryModel({this.category_id, this.title, this.amountProducts});

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      category_id: json['category_id'],
      title: json['title']??'Title',
      amountProducts: '15',
    );
  }

}