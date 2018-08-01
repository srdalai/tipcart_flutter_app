import 'package:flutter/material.dart';
import 'dart:async';

class MyAppBar extends AppBar implements StatefulWidget {

  MyAppBar({Key key, Widget title, BuildContext context, Color bgColor, bool autoLeading = true, bool cntrTtl = false, bool showSearch = true, bool notif = true}) : super(
    key: key,
    //title: title,
    elevation: 0.0,
    backgroundColor: bgColor,
    centerTitle: cntrTtl,
    automaticallyImplyLeading: autoLeading,
    title: Text("Tipcart"),
    leading: autoLeading ? new Icon(Icons.fastfood, size: 35.0,) : new IconButton(icon: new Icon(Icons.arrow_back_ios), onPressed: (){Navigator.pop(context);},),
    actions: <Widget>[
      Icon(Icons.search),
      SizedBox(width: 10.0),
      new Container(
        padding: const EdgeInsets.only(top: 7.5, bottom: 7.5, right: 10.0, left: 10.0),
        child: new InkWell(
          onTap: (){print("user clicked");},
          child: new Hero(
            tag: "user",
            child: new Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: <Widget>[
                new CircleAvatar(
                  backgroundImage: new AssetImage("assets/account_pictures/user_3.jpg"),
                  backgroundColor: Colors.white,
                ),
                notif ? new CircleAvatar(
                  child: new CircleAvatar(backgroundColor: Colors.red, radius: 6.0,),
                  radius: 8.0,
                  backgroundColor: Colors.white,
                ) : new Container()
              ],
            )
          ),
        ),
      )
    ]
  );


  static void _showAlert(BuildContext context) {

    SimpleDialog alertDialog = new SimpleDialog(
      title: new Text("Your Current Location is Set"),
      children: <Widget>[
        new FlatButton(
          onPressed: (){},
          child: new Text("OK"),
        ),
        new MaterialButton(
          onPressed: (){},
          child: new Text("Change"),
        )
      ],

    );

    showDialog(context: context, child: alertDialog);
  }

  static Future<Null> askUser(BuildContext context, Color color) async {
    switch (
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return new SimpleDialog(
            //contentPadding: const EdgeInsets.fromLTRB(0.0, 52.0, 0.0, 16.0),
            title: const Text("Current Location is set to:-", textAlign: TextAlign.center,),
            children: <Widget>[
              //new Icon(Icons.my_location, color: color, size: 50.0,),
              new Text("Mahadev Nagar, Jharpada, Bhubaneswar", textAlign: TextAlign.center, style: const TextStyle(fontSize: 20.0),),
              new ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                    color: color,
                    textColor: Colors.white,
                    onPressed: (){Navigator.pop(context, DialogActions.ok);},
                    child: new Text("Ok"),
                  ),
                  new Container(width: 50.0,),
                  new RaisedButton(
                    color: color,
                    textColor: Colors.white,
                    onPressed: (){Navigator.pop(context, DialogActions.change);},
                    child: new Text("Change"),
                  )
                ],
              ),
            ],
          );
        }
      )
    ) {
      case DialogActions.ok:
        
        break;
      case DialogActions.change:

        break;
      default:
    }
  }

}

enum DialogActions {ok, change, locate }