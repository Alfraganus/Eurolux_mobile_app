import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/catalog/CategoryListWithImage.dart';
import 'package:untitled/components/products/ProductList.dart';
import 'package:untitled/models/SubCategoryModel.dart';
import 'package:untitled/screens/CatalogScreen.dart';

import '../../service/CategoryService.dart';

class SubCategoryList extends StatelessWidget {
  final int id;
  SubCategoryList({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading:  GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Catalog()));;
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        title: Center(
          child: Text(
           'Sub kategoriyalar',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
         GestureDetector(
            onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Catalog()));;
          },
           child:  Image.asset('assets/images/profile.png'),
         ),
        ],
      ),
      body: ListViewBuilder(id:this.id),
    );
  }
}


class ListViewBuilder extends StatelessWidget {
  final int id;
  const ListViewBuilder({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: ApiService().getSubCategory(this.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
             if(snapshot.data!.length == 0){
              return Container(
                alignment: Alignment.topCenter,
                child: Center(
                  child: Text("No data available"),
                ),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              ProductList(
                                category_id:snapshot.data![index].category_id,
                                sub_category_id:snapshot.data![index].id,
                              )
                          )
                      );
                    },
                    child: Column(
                      children: [
                        ListTile(
                            trailing: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.black,
                              size:15,
                            ),
                            title: RichText(
                              text: TextSpan(
                                text: snapshot.data![index].title,
                                style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black),
                                children:  <TextSpan>[
                                  TextSpan( text:' (',style: TextStyle(fontWeight: FontWeight.w100, color: Colors.black),),
                                  TextSpan( text:snapshot.data![index].amountProducts.toString(),style: TextStyle(fontWeight: FontWeight.w100, color: Colors.black)),
                                  TextSpan( text:')',style: TextStyle(fontWeight: FontWeight.w100, color: Colors.black)),
                                ],
                              ),
                            ) /* Text(snapshot.data?[index].title??'',style: const TextStyle(
                                fontWeight: FontWeight.w900
                            ),)*/
                        ),
                        Divider(),
                      ],
                    ),
                  );
                });
          } else if(snapshot.connectionState == ConnectionState.waiting) {
            return Text("Waiting");
          } else {
            return  Text('${snapshot.error}');
          }

        });
  }
}
