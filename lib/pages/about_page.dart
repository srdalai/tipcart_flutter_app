import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[text(), text(), text(), action(), feedback()],
        ));
  }

  Widget action() {
    return Column(
      children: <Widget>[
        new RawMaterialButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          fillColor: Colors.pinkAccent,
          elevation: 5.0,
          textStyle: new TextStyle(color: Colors.white),
          child: new Row(
            children: <Widget>[Text("9556798434"), Icon(Icons.call)],
          ),
          onPressed: () {},
        )
      ],
    );
  }

  Widget text() {
    return Card(
        elevation: 5.0,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque venenatis sit amet tellus eget luctus. Donec pulvinar rhoncus mollis. Nunc rutrum nisl nec diam sagittis, eu porttitor quam eleifend. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In hac habitasse platea dictumst. Duis accumsan ut mi vitae interdum. Maecenas sollicitudin nibh nibh, sed efficitur enim posuere vitae. Maecenas pharetra mollis dolor, eu fringilla est dignissim id. Aenean mattis condimentum felis a laoreet. Sed euismod felis eu vestibulum lobortis. Vestibulum sodales massa vel orci facilisis lacinia. Cras sed sem non tellus accumsan malesuada non non metus. Aenean efficitur quam sed imperdiet blandit. Mauris placerat ornare mauris ut tempus."),
        ));
  }

  Widget feedback() {
    return Column(
      children: <Widget>[
        new TextFormField(
          decoration: new InputDecoration(hintText: "E - mail"),
        )
      ],
    );
  }
}
