import 'package:flutter/material.dart';
import 'package:the_waroenks/widgets/left_drawer.dart';
import 'package:the_waroenks/widgets/product_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.list, const Color.fromARGB(255, 0, 140, 255)),
    ItemHomepage("Tambah Item", Icons.add_circle_outline, const Color.fromARGB(255, 66, 208, 255)),
    ItemHomepage("Logout", Icons.logout, const Color.fromARGB(255, 255, 0, 0)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'The Waroenks',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              // Menambahkan judul
              const Text(
                "Selamat Datang di The Waroenks!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40), // Space between title and buttons
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: ItemCard(items[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}