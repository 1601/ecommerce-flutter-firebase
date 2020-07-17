import 'package:flutter/material.dart';
import 'package:ecommerce_flutter_firebase/constants/strings.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.homePage),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '< Google Maps Placeholder>',
            ),
            Text(
              'Show Food Landmarks',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: new Container(
        height: 140.0,
        child: new Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomRight,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 60.0,
                    child: new FloatingActionButton(
                      onPressed: () => Navigator.pushNamed(context, '/camera'),
                      tooltip: 'Capture preferred food',
                      child: new Icon(Icons.camera_alt),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
