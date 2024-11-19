import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:the_waroenks/screens/menu.dart';

class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
}

class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _product = "";
  String _description = "";
  int _amount = 0;
  
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Tambah Produkmu Disini',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Product",
                    labelText: "Product",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _product = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Product tidak boleh kosong!";
                    }
                    // Validasi panjang nama produk
                    if (value.length < 3) {
                      return "Nama produk minimal 3 karakter";
                    }
                    if (value.length > 50) {
                      return "Nama produk maksimal 50 karakter";
                    }
                    // Validasi karakter (hanya huruf, spasi, dan angka)
                    if (!RegExp(r'^[a-zA-Z0-9\s]+$').hasMatch(value)) {
                      return "Nama produk hanya boleh berisi huruf, angka, dan spasi";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Amount",
                    labelText: "Amount",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.tryParse(value ?? "0") ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Amount tidak boleh kosong!";
                    }
                    
                    // Validasi apakah benar-benar angka
                    int? parsedAmount = int.tryParse(value);
                    if (parsedAmount == null) {
                      return "Amount harus berupa angka!";
                    }
                    
                    // Validasi jumlah tidak boleh negatif
                    if (parsedAmount < 0) {
                      return "Amount tidak boleh negatif!";
                    }
                    
                    // Validasi jumlah maksimum
                    if (parsedAmount > 1000) {
                      return "Amount tidak boleh lebih dari 1000!";
                    }
                    
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Description tidak boleh kosong!";
                    }
                    
                    // Validasi panjang deskripsi
                    if (value.length < 5) {
                      return "Deskripsi minimal 5 karakter";
                    }
                    
                    if (value.length > 200) {
                      return "Deskripsi maksimal 200 karakter";
                    }
                    
                    // Validasi karakter deskripsi (memperbolehkan lebih banyak karakter)
                    if (!RegExp(r'^[a-zA-Z0-9\s.,!?()-]+$').hasMatch(value)) {
                      return "Deskripsi mengandung karakter yang tidak valid";
                    }
                    
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).colorScheme.primary),
                    ),
                    onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                            // Kirim ke Django dan tunggu respons
                            // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                            final response = await request.postJson(
                                "http://localhost:8000/create-flutter/",
                                jsonEncode(<String, String>{
                                    'productName': _product,
                                    'description': _description,
                                    'stock': _amount.toString(),
                                // TODO: Sesuaikan field data sesuai dengan aplikasimu
                                }),
                            );
                            if (context.mounted) {
                                if (response['status'] == 'success') {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                    content: Text("Product Product baru berhasil disimpan!"),
                                    ));
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                        content:
                                            Text("Terdapat kesalahan, silakan coba lagi."),
                                    ));
                                }
                            }
                        }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}