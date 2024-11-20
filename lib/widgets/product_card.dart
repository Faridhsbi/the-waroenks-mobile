import 'package:flutter/material.dart';
import 'package:the_waroenks/screens/productentry_form.dart';
import 'package:the_waroenks/screens/login.dart';
import 'package:the_waroenks/screens/list_productentry.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () async {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!")),
            );

          if (item.name == "Tambah Item") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductEntryFormPage(),
              ),
            );
          } else if (item.name == "Lihat Daftar Produk") {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProductEntryPage()
                ),
              );
          } else if (item.name == "Logout") {
            final response = await request.logout(
                "http://localhost:8000/auth/logout/");
            String message = response["message"];
            if (context.mounted) {
                if (response['status']) {
                    String uname = response["username"];
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("$message Sampai jumpa, $uname."),
                    ));
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(message),
                        ),
                    );
                }
            }
        }
        },
        child: Container(
          padding: const EdgeInsets.all(16), // Increased padding
          decoration: BoxDecoration(
            color: item.color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8.0,
                offset: Offset(0, 4), // Shadow position
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                item.icon,
                color: Colors.white,
                size: 30.0,
              ),
              const SizedBox(width: 10), // Space between icon and text
              Text(
                item.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18, //  font size
                  fontWeight: FontWeight.bold, // Bold text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}