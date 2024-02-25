import 'package:flutter/material.dart';
import 'package:bookstore_app/models/product.dart';

class ProductListScreen extends StatelessWidget {
  static const routeName = '/product-list-screen';

  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> productList = [
      Product(id: 1, name: 'product 1', price: 10),
      Product(id: 2, name: 'product 2', price: 20),
      Product(id: 3, name: 'product 3', price: 30),
      Product(id: 4, name: 'product 4', price: 40),
      Product(id: 5, name: 'product 5', price: 50),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            final product = productList[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text('\$${product.price}'),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_shopping_cart_outlined)),
            );
          }),
    );
  }
}
