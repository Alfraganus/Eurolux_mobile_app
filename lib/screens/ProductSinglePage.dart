import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/ProductModel.dart';
import '../service/ProductService.dart';

class ProductSingle extends StatelessWidget {
  final int id;
  const ProductSingle({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder(
        builder: (index, snapshot) {
          print(snapshot.data);
          return Column(
            children: [
              header(snapshot.data?[0].title,snapshot.data?[0].price),
              Hero(),
              SingleChildScrollView(child: section()),
            ],
          );
        },
        future: ProductApiService().getSingleProduct(11),
      ),
    );
  }

  Widget header( title,price) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          Text(title,
              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16)),
          Text(price,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24))
        ],
      ),
    );
  }

  Widget section() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In "
            "rutrum at ex non eleifend. Aenean sed eros a purus "
            "gravida scelerisque id in orci. Mauris elementum id "
            "nibh et dapibus. Maecenas lacinia volutpat magna",
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.black, fontSize: 14, height: 1.5),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

}
class Hero extends StatelessWidget {
  const Hero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Stack(
          children: [
            Image.asset("local/11674790089.jpg",
              height:  MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width * 0.60,
            ),
          ],
        ),
      ),
    );
  }
}

