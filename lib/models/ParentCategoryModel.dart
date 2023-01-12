class ParentCategory {
  final String? imageUrl;
  final String? title;
  final String? amountProducts;

  ParentCategory({this.imageUrl, this.title, this.amountProducts});

  factory ParentCategory.fromJson(Map<String, dynamic> json) {
    return ParentCategory(
      imageUrl: json['icon'],
      title: json['title'],
      amountProducts: '15',
    );
  }
}