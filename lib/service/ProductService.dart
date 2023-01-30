import 'dart:convert';
import 'package:http/http.dart';
import 'package:untitled/models/ProductModel.dart';

class ProductApiService {
  Future<List<ProductModel>> getProducts(category_id, sub_category_id) async {
    Response response = await get(Uri.parse(
        'http://eurolux.api/publication/api-no-auth/get-publications-by-category-id?category_id=${category_id}&sub_category_id=${sub_category_id}'));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => ProductModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
