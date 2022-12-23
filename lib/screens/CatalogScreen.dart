import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/catalog/SearchHeader.dart';

import '../components/catalog/CategoryListWithImage.dart';

class Catalog extends StatelessWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
             SearchHeader(),
            CategoryList(),
          ],
        ),
      ),
    );
  }
}
