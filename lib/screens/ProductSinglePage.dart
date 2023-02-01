import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductSingle extends StatelessWidget {
  const ProductSingle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        header(),
        const Hero(),
        SingleChildScrollView(child: section()),
      ],
    ));
  }

  Widget header() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          Text("MEN'S ORIGINAL",
              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16)),
          Text("150 000 so\'m",
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

