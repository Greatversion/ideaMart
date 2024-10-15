import 'package:flutter/material.dart';
import 'package:idealmart/Reusable%20widgets/product_card.dart';
import 'package:idealmart/models/product_model.dart';
import 'package:idealmart/utils/colors.dart';
import 'package:idealmart/utils/products.dart';

class ProductGridPage extends StatefulWidget {
  @override
  _ProductGridPageState createState() => _ProductGridPageState();
}

class _ProductGridPageState extends State<ProductGridPage> {
  List<Product> filteredProducts = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  void _filterProducts(String query) {
    setState(() {
      searchQuery = query;
      filteredProducts = products
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(249, 247, 247, 247),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "All Products",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                cursorColor: Colors.white,
                onChanged: _filterProducts,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  hintText: 'Search products...',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(239, 233, 233, 233)),
                  border: InputBorder.none,
                  icon: const Icon(Icons.search, color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 14, 128, 88)),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Scrollbar(
          thickness: 2,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 600
                  ? 3
                  : 2, // Responsive columns
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio:
                  0.75, // Adjust aspect ratio to fit product image and text
            ),
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              return ProductCard(product: filteredProducts[index]);
            },
          ),
        ),
      ),
    );
  }
}
