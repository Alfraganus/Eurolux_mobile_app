import 'dart:convert';
import 'package:http/http.dart';
import 'package:untitled/components/catalog/SubCategoryList.dart';
import 'package:untitled/models/ParentCategoryModel.dart';
import 'package:untitled/models/SubCategoryModel.dart';

class ApiService {
  Future<List<ParentCategoryModel>> getCategory() async {
    Response response =
        await get(Uri.parse("http://eurolux.api/category/category"));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => ParentCategoryModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<SubCategoryModel>> getSubCategory(int category_id) async {
    Response response = await get(Uri.parse('http://eurolux.api/category/category/sub?category_id=${category_id}'));
    if(response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => SubCategoryModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
