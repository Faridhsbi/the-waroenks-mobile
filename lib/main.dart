import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:the_waroenks/screens/login.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'The Wareonks',
        theme: ThemeData(

        colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.lightBlue,
        ).copyWith(secondary: Colors.lightBlue[600]),

        scaffoldBackgroundColor: Colors.lightBlue[100], // Set background color
        ),
        home: const LoginPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


