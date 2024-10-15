import 'package:flutter/material.dart';
import 'package:idealmart/models/product_model.dart';
import 'package:idealmart/utils/colors.dart';
import 'package:idealmart/utils/snackBar.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final Function(Product) onAddToCart;

  const ProductCard({
    Key? key,
    required this.product,
    required this.onAddToCart, // Callback to update cart in parent widget
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isAdded = false;
  int quantity = 1;

  void _showProductDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int dialogQuantity = quantity;
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Product Details'),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                icon: const Icon(Icons.close),
                color: Colors.black,
              ),
            ],
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setDialogState) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        widget.product.imagePath,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Product Name
                    Text(
                      widget.product.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),

                    // Price Details
                    Row(
                      children: [
                        Text(
                          "₹${dialogQuantity * widget.product.price}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "₹${widget.product.discountPrice * dialogQuantity}",
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 14,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Quantity Selector
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Quantity:',
                          style: TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          onPressed: () {
                            setDialogState(() {
                              if (dialogQuantity > 1) dialogQuantity--;
                            });
                          },
                          icon: const Icon(Icons.remove),
                        ),
                        Text(
                          '$dialogQuantity',
                          style: const TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          onPressed: () {
                            setDialogState(() {
                              dialogQuantity++;
                            });
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Add to Cart Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            quantity = dialogQuantity; // Update main widget's quantity
                            isAdded = true;
                          });
                          widget.onAddToCart(widget.product); // Add product to cart
                          Navigator.pop(context); // Close the dialog
                          SnackBarHelper.showSnackBar(context,
                              "Added to Cart: ${widget.product.name} X $dialogQuantity");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showProductDetailsDialog(context);
      },
      child: Card(
        color: const Color.fromARGB(255, 246, 246, 246),
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  widget.product.imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Aditya Retailer limited",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 121, 121, 121)),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "₹${widget.product.price.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "₹${widget.product.discountPrice.toStringAsFixed(2)}",
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isAdded = !isAdded;
                            });
                            widget.onAddToCart(widget.product); // Add product to cart
                            SnackBarHelper.showSnackBar(context,
                                "Added to Cart: ${widget.product.name}");
                          },
                          icon: Icon(
                            isAdded
                                ? Icons.shopping_cart_rounded
                                : Icons.shopping_cart_outlined,
                            color:
                                isAdded ? AppColors.primaryColor : Colors.grey,
                            size: 28,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
