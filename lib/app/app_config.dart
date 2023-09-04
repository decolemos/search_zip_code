import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_zip_code/providers/search_provider.dart';
import 'package:search_zip_code/screens/home.dart';

class AppConfig extends StatelessWidget {
  const AppConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      child: MaterialApp(
        routes: {
          "/":(context) => const HomePage()
        },
      ),
    );
  }
}