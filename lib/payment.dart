import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'home_screen.dart';
import 'service.dart';

enum PaymentMethod { card, cash, paypal }

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late Future<double> _grandTotalFuture;
  late Future<List<Map<String, dynamic>>> coffeeHistory;

  IconData _getIconForPaymentMethod(String method) {
    switch (method) {
      case 'Bank':
        return Icons.account_balance;
      case 'Cash':
        return Icons.money;
      case 'E-Wallet':
        return Icons.account_balance_wallet;
      case 'QRIS':
        return Icons.qr_code;
      default:
        return Icons.payment;
    }
  }

  _PaymentPageState() {
    _grandTotalFuture = PaymentService.getGrandTotal();
    coffeeHistory = CoffeeHistoryService.loadCoffeeHistory();
  }

  @override
  void initState() {
    super.initState();
    coffeeHistory = CoffeeHistoryService.loadCoffeeHistory();
  }

  void _showPaymentMethodDialog(BuildContext context) {
    String _chosenValue = 'Bank'; // Default chosen value

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Choose Payment Method'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <String>['Bank', 'Cash', 'E-Wallet', 'QRIS']
                    .map((String value) {
                  return ListTile(
                    leading:
                        Icon(_getIconForPaymentMethod(value)), // Add an icon
                    title: Text(value),
                    trailing: Radio<String>(
                      value: value,
                      groupValue: _chosenValue,
                      onChanged: (String? value) {
                        setState(() {
                          _chosenValue = value!;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Choose'),
                  onPressed: () {
                    // Show a new dialog with a success message and an animation
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // Start the timer to close the dialog
                        Future.delayed(const Duration(seconds: 1), () {
                          // Replace the current route with a new route
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        });

                        return AlertDialog(
                          title: const Text('Payment Successful'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text('Your payment method: $_chosenValue'),
                              const SizedBox(height: 20),
                              Lottie.asset("images/success.json"),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Details'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: coffeeHistory,
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ColoredBox(
              color: Colors.black,
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: const Color(0xff242931),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: const Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage(
                              'images/account-profile-user-icon--icon-search-engine-10.png'),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Text(
                          "User",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: Colors.black,
                        height: 5,
                      );
                    },
                    itemBuilder: (context, index) {
                      var coffee = snapshot.data![index];
                      return Material(
                        child: ListTile(
                          tileColor: Colors.grey,
                          title: Text(
                            coffee['title'],
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            coffee['description'],
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Text(
                            '\Rp.${coffee['price'].toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder<double>(
                    future: _grandTotalFuture,
                    builder:
                        (BuildContext context, AsyncSnapshot<double> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return ElevatedButton(
                            onPressed: () {
                              _showPaymentMethodDialog(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffd17842),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(16.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.shopping_cart,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Pay Now',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Total: ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '\Rp.${snapshot.data!.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ));
                      }
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
