import 'package:flutter/material.dart';
import 'coffee_details_page.dart';

// ignore: must_be_immutable
class SpecialCoffeeCard extends StatelessWidget {
  List<String> specialImages = [
    "images/kaffebase-coffeeshop-uAx74-kc5Kw-unsplash.jpg",
    "images/coffee.jpg",
    "images/lattee.jpg"
  ];

  List<String> coffeeName = [
    "Caramel Macchiato ",
    "Turkish Coffee",
    "Cafe Cubanoi"
  ];

  List<String> ingredients = [
    "Ice, Cramel Sauce, Espresso",
    "Turkish coffee, Sugar",
    "Ground Coffee, Water"
  ];

  List<String> price = ["15.0", "18.0", "20.0"];
  List<String> rating = ["4.5", "4.0", "4.5"];

  SpecialCoffeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: specialImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CoffeeDetailsPage(
                    key: const Key('coffee_details_page'),
                    title: coffeeName[index],
                    description: ingredients[index],
                    price: double.parse(price[index]),
                    rating: rating[index],
                    image: specialImages[index],
                  ),
                ),
              );
            },
            child: Column(
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
                                image: AssetImage(specialImages[index]),
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
                            coffeeName[index],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            ingredients[index],
                            style: const TextStyle(
                                color: Color(0xff919293), fontSize: 12),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    r'Rp. ',
                                    style: TextStyle(
                                        color: Color(0xffd17842),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    price[index],
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
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ))
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
            ),
          );
        });
  }
}
