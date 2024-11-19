import 'package:flutter/material.dart';
import 'package:the_waroenks/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.fields.productName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${product.fields.productName}",
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Price: Rp${product.fields.price}",
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 16),
                Text(
                  "Description: ${product.fields.description}",
                  style: const TextStyle(fontSize: 14.0),
                ),
                const SizedBox(height: 16),
                Text(
                  "Stock: ${product.fields.stock}",
                  style: const TextStyle(fontSize: 14.0),
                ),
                const SizedBox(height: 16),
                Text(
                  "Rating: ${product.fields.rating}",
                  style: const TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
