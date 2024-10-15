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
  List<Product> cartItems = []; // List to track items in the cart

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

  void _addToCart(Product product) {
    setState(() {
      cartItems.add(product);
    });
  }

  void _showCartDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // backgroundColor: const Color.fromARGB(202, 234, 234, 234),
          title: const Text('Cart'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: cartItems.map((product) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(product.imagePath),
                ),
                title: Text(product.name),
                subtitle: Text('₹${product.price.toStringAsFixed(2)}'),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(249, 247, 247, 247),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "iDealMart",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: _showCartDialog,
                  child: Row(
                    children: [
                      const Icon(Icons.shopping_cart, color: Colors.white),
                      const SizedBox(width: 2),
                      Text(
                        cartItems.length.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              cursorColor: Colors.white,
              onChanged: _filterProducts,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.grey[100],
                hintText: 'Search products...',
                hintStyle:
                    const TextStyle(color: Color.fromARGB(239, 233, 233, 233)),
                border: InputBorder.none,
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 14, 128, 88),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Scrollbar(
          thickness: 2,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.55,
            ),
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              return ProductCard(
                product: filteredProducts[index],
                onAddToCart: _addToCart,
              );
            },
          ),
        ),
      ),
    );
  }
}
