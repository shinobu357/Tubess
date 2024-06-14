import 'package:flutter/material.dart';
import 'payment.dart';
import 'service.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  List<Map<String, dynamic>> coffeeHistory = [];

  @override
  void initState() {
    super.initState();
    _loadCoffeeHistory();
  }

  _loadCoffeeHistory() async {
    coffeeHistory = await CoffeeHistoryService.loadCoffeeHistory();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Checkout Page',
              style: TextStyle(color: Colors.white)),
          backgroundColor: const Color(0xff141921),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Container(
            height: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: coffeeHistory.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: const Color(0xff141921),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 120,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          coffeeHistory[index]['image']),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  coffeeHistory[index]['title'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  coffeeHistory[index]['description'],
                                  style: const TextStyle(
                                      color: Color(0xff919293), fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          r'Rp.',
                                          style: TextStyle(
                                              color: Color(0xffd17842),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          "${coffeeHistory[index]['price']}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 80,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffd17842),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () async {
                                            await CoffeeHistoryService
                                                .removeItemFromCheckout(index);
                                            setState(() {
                                              coffeeHistory.removeAt(index);
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  );
                }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const PaymentPage();
            }));
          },
          backgroundColor: const Color(0xffd17842),
          child: const Icon(Icons.shopping_cart_outlined),
        ));
  }
}
