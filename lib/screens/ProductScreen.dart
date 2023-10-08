import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/catalog/SearchHeader.dart';
import 'package:untitled/components/products/ProductList.dart';

import '../components/catalog/CategoryListWithImage.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product screen'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: const [
              // ProductScreen(),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
