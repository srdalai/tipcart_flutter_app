import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tipcart_app/utlities/rest_data.dart';

Future<RootCategories> fetchRawCategories() async {
  final response = await http.get('http://tipcart.in/api.php?term=get_categories');
  final responseJson = json.decode(response.body);

  return new RootCategories.fromJson(responseJson);
}

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  BuildContext scaffoldContext;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new FutureBuilder<RootCategories>(
            future: fetchRawCategories(),
            builder: (context, snapshot) {
              scaffoldContext = context;
              if(snapshot.hasData) {
                List catData = snapshot.data.mainCats.toList();
                return new SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: new Column(
                    children: catData.map((data) => create(data)).toList(),
                  ),
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return new Text("${snapshot.error}");
              }
            },
          ),
      ),
    );
  }

  Widget create(var e) {
    ProductCategory cat = new ProductCategory.fromJson(e);

    if (cat.parent == 0 && cat.name != "Uncategorized") {
      return  new InkWell(
        onTap: () {
          Scaffold.of(scaffoldContext).showSnackBar(new SnackBar(content: new Text("Clicked on - ${cat.name}"), duration: new Duration(seconds: 5),));
        },
        child: new Card(
          margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: new Container(
            height: 150.0,
            decoration: new BoxDecoration(image: new DecorationImage(image: new NetworkImage(cat.image), fit: BoxFit.fitWidth)),
            child: new Container(
              color: Colors.black.withAlpha(90),
              child: new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(cat.name, style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold),),
                    new Text("${cat.count.toString()} items", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),),
                  ],
                )
              )
            )
          ),
        ),
      );
    }
    else {
      return Container();
    }
    
  }
}