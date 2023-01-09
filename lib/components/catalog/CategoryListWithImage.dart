import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
              margin: const EdgeInsets.symmetric(horizontal: 6,vertical: 20),
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
                child: Text('40 ta elonlar'),  ),
            ],
          ) ;
        }),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(
      this.itemNo,
      );

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.primaries[itemNo % Colors.primaries.length];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      child: ListTile(
        tileColor:HexColor('#FFFFFF'),
        onTap: () {},
        title:  Stack(
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


