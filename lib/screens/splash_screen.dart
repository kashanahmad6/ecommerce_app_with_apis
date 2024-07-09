import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_with_apis/provider/shop_provider.dart';
import 'package:shopping_app_with_apis/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getToHomePage();
  }

  void getToHomePage() async {
    await Provider.of<ShopProvider>(context, listen: false)
        .getItems()
        .then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
