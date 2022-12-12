import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_with_flutter/screens/home_page.dart';
import 'package:wallet_with_flutter/screens/wallet_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/wallet', page: () => const WalletScreen())
      ],
    );
  }
}

