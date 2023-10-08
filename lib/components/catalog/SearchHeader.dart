import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: SearchInput()),
        AdvancedSearchIcon(),
      ],
    );
  }
}


class AdvancedSearchIcon extends StatelessWidget {
  const AdvancedSearchIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(7 ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/images/icon_search_background.png'),
          Image.asset('assets/images/search_icon_content.png'),
        ],
      ),
    );
  }
}


class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 25),
      child: TextField(
        decoration: InputDecoration(
          filled: true,

          contentPadding: EdgeInsets.symmetric(horizontal:0,vertical: 17),
          prefixIcon: ImageIcon(
            AssetImage('assets/images/lupa.png'),
            color: HexColor('#7567cb1a'),
            size: 10,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          hintText: 'Izlash hizmatidan foydalanish...',
        ),
      ),
    );
  }
}

