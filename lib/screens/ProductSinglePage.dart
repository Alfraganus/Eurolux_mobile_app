import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/ProductModel.dart';
import '../components/catalog/SubCategoryList.dart';
import '../service/ProductService.dart';

class ProductSingle extends StatelessWidget {
  final int id;
  const ProductSingle({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0, // const Icon(Icons.arrow_back_ios_rounded,color: Colors.black,)
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon:Icon(Icons.arrow_back_ios_rounded,color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:  Center(
          child: Text('te',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),),
        ),

      ),
      body: FutureBuilder(
        builder: (index, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    header(
                        snapshot.data!.title, snapshot.data!.price.toString()),
                    Hero(price: snapshot.data!.price.toString(),
                      image: snapshot.data!.image.toString(),),
                    SizedBox(height: 15,),
                    section(snapshot.data!.description),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
        future: ProductApiService().getSingleProduct(this.id),
      ),
    );
  }

  Widget header( title,price) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text(title, style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16)),
      );
  }

  Widget section(description) {
    return Container(
      child: Column(
        children: [
          Text(
            description,
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
  final String price;
  final String image;
  const Hero({Key? key, required this.price,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Image.asset(image,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.45,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.60,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(price+" so\'m",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24)),
            ),
          ]
      ),
    );
  }
}

