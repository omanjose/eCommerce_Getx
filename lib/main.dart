import 'package:e_commerce/EbeanoShop/ebeanoHomePage.dart';
import 'package:e_commerce/WishlistCount/wishHome.dart';
import 'package:e_commerce/shopX/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StaticPage(),
    );
  }
}

class StaticPage extends StatefulWidget {
  const StaticPage({Key? key}) : super(key: key);

  @override
  _StaticPageState createState() => _StaticPageState();
}

class _StaticPageState extends State<StaticPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Some features of e-commerce using get')),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: Text(
                  'New Market',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                ),
              ),
              Divider(
                height: 2,
                color: Colors.black,
              ),
              SizedBox(height: 5),
              ListTile(
                title: Text(
                  'Ebeano Mall',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EbeanoHomePage()),
                ),
              ),
              Divider(
                height: 2,
                color: Colors.black,
              ),
              SizedBox(height: 5),
              ListTile(
                title: Text(
                  'WishList Demo',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WishHomeScreen()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
