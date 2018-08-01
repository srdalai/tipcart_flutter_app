import 'package:flutter/material.dart';
import 'package:tipcart_app/pages/about_page.dart';
import 'package:tipcart_app/pages/brand_page.dart';
import 'package:tipcart_app/pages/home_page.dart';
import 'package:tipcart_app/pages/shop_page.dart';
import 'package:tipcart_app/widgets/custom_widgets.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  TabController tabController;
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    ShopPage(),
    BrandPage(),
    AboutPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new MyAppBar(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          fixedColor: Colors.deepOrangeAccent,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
                backgroundColor: Colors.teal),
            BottomNavigationBarItem(
                icon: Icon(Icons.store),
                title: Text("Shop"),
                backgroundColor: Colors.deepOrangeAccent),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_bar),
                title: Text("Brands"),
                backgroundColor: Colors.deepPurple),
            BottomNavigationBarItem(
                icon: Icon(Icons.info),
                title: Text("About Us"),
                backgroundColor: Colors.blueGrey)
          ]),
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
