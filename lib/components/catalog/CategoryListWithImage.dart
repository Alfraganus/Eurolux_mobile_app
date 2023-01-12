import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/models/ParentCategoryModel.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  late Future<ParentCategory> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  Future<ParentCategory> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ParentCategory.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(//bu yerga future builder qoyiladi
        crossAxisCount: 2,
        // childAspectRatio:3.5/ 3.4,
        shrinkWrap: true,
        // Generate 100 widgets that display their index in the List.
        children: _categories!.map((product) {

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 200,
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor('#8f57f326').withOpacity(0.10),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child:   Image.network(product.imageUrl.toString()),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  product.title.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('40 ta elonlar'),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}


class ShowCategory extends StatefulWidget {
  const ShowCategory({Key? key, required this.imageUrl, required this.title}) : super(key: key);

  final String imageUrl;
  final String title;

  @override
  State<ShowCategory> createState() => _ShowCategoryState();
}

class _ShowCategoryState extends State<ShowCategory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            height: 200,
            width: double.infinity,
            margin:
            const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
            padding: const EdgeInsets.symmetric(vertical: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: [
                BoxShadow(
                  color: HexColor('#8f57f326').withOpacity(0.10),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
            ),
            child:   Image.network(this.widget.imageUrl),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            this.widget.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('40 ta elonlar'),
        ),
      ],
    );;
  }
}


/*
class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        // childAspectRatio:3.5/ 3.4,
        shrinkWrap: true,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(10, (index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 200,
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor('#8f57f326').withOpacity(0.10),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Image.asset('images/car.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Naushniklar',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('40 ta elonlar'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
*/

class ItemTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      child: ListTile(
        tileColor: HexColor('#FFFFFF'),
        onTap: () {},
        title: Stack(
          fit: StackFit.passthrough,
          alignment: Alignment.center,
          children: [
            Image.asset('images/category_background.png'),
            Image.asset('images/car.png'),
          ],
        ),
        subtitle: Text('Elektronika'),
      ),
    );
  }
}
