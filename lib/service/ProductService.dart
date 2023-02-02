import 'dart:convert';
import 'package:http/http.dart';
import 'package:untitled/models/ProductModel.dart';
import '../constants/CoreConstants.dart';
class ProductApiService {
  
  String apiUrl = Constants.BASE_API_URL + "endpoint";

  Future<List<ProductModel>> getProducts(category_id, sub_category_id) async {
    Response response = await get(Uri.parse(
        Constants.BASE_API_URL+'publication/api-no-auth/get-publications-by-category-id?category_id=${category_id}&sub_category_id=${sub_category_id}'));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => ProductModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }


  Future<ProductModel> getSingleProduct(id) async {
    Response response = await get(Uri.parse(Constants.BASE_API_URL +
        "publication/api-no-auth/get-publications-by-id?id=${id}")
    );
    if (response.statusCode == 200) {
       return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.reasonPhrase);
    }
    return Future.error('Failed to fetch product data');
  }
}
