import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/models/ParentCategoryModel.dart';
import 'package:untitled/models/ProductModel.dart';
import 'package:untitled/screens/ProductSinglePage.dart';
import 'package:untitled/service/CategoryService.dart';
import '../../service/ProductService.dart';
import '../catalog/SubCategoryList.dart';

class ProductList extends StatelessWidget {
  final String category_id;
  final String sub_category_id;

  const ProductList(
      {super.key, required this.category_id, required this.sub_category_id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SubCategoryList(id: int.parse(this.category_id))));
            ;
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        title: Center(
          child: Text(
            'Product list',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SubCategoryList(id: int.parse(this.category_id))));
              ;
            },
            child: Image.asset('assets/images/profile.png'),
          ),
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: ProductApiService()
            .getProducts(this.category_id, this.sub_category_id),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: GridView.count(
                crossAxisCount: 2,
                // childAspectRatio:3.5/ 3.4,
                shrinkWrap: true,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(snapshot.data?.length ?? 0, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProductSingle(id:snapshot.data![index].id)
                      ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 20),
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              boxShadow: [
                                BoxShadow(
                                  color: HexColor('#8f57f326').withOpacity(0.10),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset:
                                      Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                            ),
                            child: Image.network(snapshot.data?[index].image
                                    .toString() ??
                                ''), // Image.network(snapshot.data?[index].imageUrl??''),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                snapshot.data?[index].title.toString() ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              snapshot.data![index].price.toString()+' so\'m' ?? '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
