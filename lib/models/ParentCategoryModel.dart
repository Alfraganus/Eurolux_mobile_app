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

/*  static List<ParentCategory> fetchData({required List jsonList}) {
    List<ParentCategory> list = [];

    for (int i = 0; i < jsonList.length; i++) {
      list.add(ParentCategory.fromJson(json: jsonList[i]));
    }

    return list;
  }*/

}