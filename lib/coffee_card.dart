import 'package:flutter/material.dart';

import 'coffee_details_page.dart';

// ignore: must_be_immutable
class CoffeeCard extends StatelessWidget {
  List<String> images = [
    "images/tyler-nix-nwdtkFzDfPY-unsplash.jpg",
    "images/newcappuccino.jpg",
    "images/newcoffee.jpg",
    "images/nicholas-grande-Hd36cpebWbQ-unsplash.jpg",
  ];

  List<String> ingredients = [
    "With Oat Milk",
    "With Cinnamon Powder",
    "With Chocolate Powder",
    "With Caramel Drizzle"
  ];

  List<String> coffeeName = ["Cappuccino", "Espresso", "Latte", "Mocha"];
  List<String> rating = ["4.5", "4.0", "4.5", "4.5"];
  List<double> price = [12.0, 10.0, 18.0, 15.0];

  CoffeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CoffeeDetailsPage(
                          key: const Key('coffee_details_page'),
                          title: coffeeName[index],
                          description: ingredients[index],
                          price: price[index],
                          rating: rating[index],
                          image: images[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 250,
                    width: 160,
                    decoration: BoxDecoration(
                        color: const Color(0xff242931),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 135,
                          width: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(images[index]),
                                  fit: BoxFit.cover)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                coffeeName[index],
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                ingredients[index],
                                style: const TextStyle(
                                    color: Color(0xff919293), fontSize: 11),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        "${price[index]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffd17842),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      ))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            );
          }),
    );
  }
}
