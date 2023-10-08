import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/catalog/SearchHeader.dart';

import '../components/catalog/CategoryListWithImage.dart';
import '../components/catalog/SubCategoryList.dart';

class Catalog extends StatelessWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0.5,
        backgroundColor: Colors.white,

        title: Center(
          child: Text(
            'Asosiy',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          GestureDetector(
            child: Image.asset('assets/images/profile.png'),
          ),
        ],
      ),*/
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: const [
             SearchHeader(),
              ParentCategory(),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
