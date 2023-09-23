import 'package:flutter/material.dart';
import 'package:flutter_application_1_19_9/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key, required this.product});

  List<ProductModel> product = [];

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  List<ProductModel> cartProduct = [];
  _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var element in widget.product) {
      if (prefs.containsKey(element.name!)) {
        cartProduct.add(element);
      }
    }
    setState(() {});
    // String data = prefs.getString("shoes") ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carts"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            trailing: InkWell(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();

                prefs.remove(cartProduct[index].name!);
                cartProduct.remove(cartProduct[index]);
                setState(() {});
              },
              // child: Text("Remove from Cart")
              child: const Icon(Icons.remove_circle_outline),
            ),
            title: Text(cartProduct[index].name!),
            subtitle: Text(cartProduct[index].category!),
            leading: Text(cartProduct[index].price.toString()),
          ));
        },
        itemCount: cartProduct.length,
      ),
    );
  }
}
