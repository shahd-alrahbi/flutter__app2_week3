import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1_19_9/models/product_model.dart';
import 'package:flutter_application_1_19_9/screens/cart_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> products = [
    ProductModel(name: "shoes", category: "shoes", price: 400.0),
    ProductModel(name: "Black Bag", category: "Bags", price: 200.0),
    ProductModel(name: "Sport Watch", category: "Watch", price: 300.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(product: products),
                    ));
              },
              icon: Icon(Icons.shopping_cart))
        ],
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            trailing: IconButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  String data = jsonEncode(products[index].toMap());
                  prefs.setString(products[index].name!, data);
                },
                icon: const Icon(Icons.add_shopping_cart)),
            title: Text(products[index].name!),
            subtitle: Text(products[index].category!),
            leading: Text(products[index].price.toString()),
          ));
        },
        itemCount: products.length,
      ),
    );
  }
}
