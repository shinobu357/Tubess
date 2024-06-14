import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class CoffeeHistoryService {
  static Future<void> addCoffeeToHistory(
      String title, String description, String image, double price) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> coffeeHistory = prefs.getStringList('coffeeHistory') ?? [];
    Map<String, dynamic> newCoffee = {
      'title': title,
      'description': description,
      'image': image,
      'price': price,
    };
    coffeeHistory.add(jsonEncode(newCoffee));
    await prefs.setStringList('coffeeHistory', coffeeHistory);

    // Update the grand total
    double grandTotal = (prefs.getDouble('grandTotal') ?? 0.0) + price;
    await prefs.setDouble('grandTotal', grandTotal);
  }

  static Future<List<Map<String, dynamic>>> loadCoffeeHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> storedHistory = prefs.getStringList('coffeeHistory') ?? [];
    return storedHistory
        .map((item) => jsonDecode(item) as Map<String, dynamic>)
        .toList();
  }

  static Future<void> removeItemFromCheckout(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> checkoutItems = prefs.getStringList('checkoutItems') ?? [];
    if (index >= 0 && index < checkoutItems.length) {
      checkoutItems.removeAt(index);
      await prefs.setStringList('checkoutItems', checkoutItems);
    }
  }
}

class PaymentService {
  static Future<double> getGrandTotal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double grandTotal = prefs.getDouble('grandTotal') ?? 0.0;
    return grandTotal;
  }
}
