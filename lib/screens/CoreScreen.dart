import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/screens/CatalogScreen.dart';

class CoreWidget extends StatefulWidget {
  const CoreWidget({super.key});

  @override
  State<CoreWidget> createState() => _CoreWidgetState();
}

class _CoreWidgetState extends State<CoreWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
    List<String> AppbarTitle = [
    'Bosh sahifa',
    'Catalog',
  ];
  static const List<Widget> _widgetOptions = <Widget>[
    Catalog(),
    Test(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back_ios_rounded,color: Colors.black,),
        title:  Center(
          child: Text(AppbarTitle.elementAt(_selectedIndex),
            style: TextStyle(
            color: Colors.black,
              fontWeight: FontWeight.bold
          ),),
        ),
        actions: [
          Image.asset('images/profile.png'),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(top: 15),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/lenta.png'),
                size: 36,
              ),
              label: 'Asosiy',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/catalog.png'),
              ),
              label: 'Catalog',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: HexColor('#7567CB'),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Hello I am working');
  }
}
