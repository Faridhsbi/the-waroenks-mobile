import 'package:flutter/material.dart';
import 'package:the_waroenks/screens/menu.dart';
import 'package:the_waroenks/screens/productentry_form.dart';
import 'package:the_waroenks/screens/list_productentry.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
                Text(
                  'The Waroenks',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Makanan dan Minuman Murah Berkualitas hanya disini😘😋🤫🧏!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Halaman Utama'),
              // Bagian redirection ke MyHomePage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_shopping_cart),
              title: const Text('Tambah Item'),
              // Bagian redirection ke productEntryFormPage
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductEntryFormPage(),
                  ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.view_list_rounded),
              title: const Text('Daftar Product'),
              onTap: () {
                  // Route menu ke halaman product 
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProductEntryPage()),
                  );
              },
            ),
        ],
      ),
    );
  }
}