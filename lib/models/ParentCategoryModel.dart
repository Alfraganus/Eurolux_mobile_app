
class ParentCategoryModel {
  final int id;
  final String? imageUrl;
  final String? title;
  final String? amountProducts;

  ParentCategoryModel({required this.id,this.imageUrl, this.title, this.amountProducts});

  factory ParentCategoryModel.fromJson(Map<String, dynamic> json) {
    return ParentCategoryModel(
      id: json['id'],
      imageUrl: 'local/'+ json['icon'],
      title: json['title']??'Title',
      amountProducts: '15',
    );
  }

}