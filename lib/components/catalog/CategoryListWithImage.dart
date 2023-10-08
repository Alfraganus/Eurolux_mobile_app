import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/models/ParentCategoryModel.dart';
import 'package:untitled/service/CategoryService.dart';

import '../../constants/CoreConstants.dart';
import 'SubCategoryList.dart';

class ParentCategory extends StatelessWidget {
  const ParentCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ParentCategoryModel>>(
      future: ApiService().getCategory(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return  GridView.count(
            crossAxisCount: 2,
            // childAspectRatio:3.5/ 3.4,
            shrinkWrap: true,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(snapshot.data?.length??0, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          SubCategoryList(id: snapshot.data![index].id)
                      )
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        child:Image.network(
                          snapshot.data?[index].imageUrl??'',
                        ),//Image.asset(snapshot.data?[index].imageUrl.toString()??'') ,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        snapshot.data?[index].title??'',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(snapshot.data?[index].amountProducts??''),
                    ),
                  ],
                ),
              );
            }),
          );
        }else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}


