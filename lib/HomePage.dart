
import 'package:flutter/material.dart';
import 'MainDrawer.dart';
import './MyBody.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title:  Text(
          'Magazine info',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "roboto",
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
        actions: [Icon(Icons.home)],
      ),
    body:MyBody(),
    );
  }
}
