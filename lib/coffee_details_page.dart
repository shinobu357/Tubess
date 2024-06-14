// ignore: depend_on_referenced_packages
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'selection.dart';
import 'service.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';

class CoffeeDetailsPage extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final String rating;
  final String image;

  const CoffeeDetailsPage({
    required Key key,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 440,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                            image: AssetImage(image), fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: 320,
                    child: BlurryContainer(
                      padding: const EdgeInsets.all(20),
                      height: 140,
                      color: const Color(0xff141921),
                      width: 377,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                description,
                                style: const TextStyle(
                                  color: Color(0xff919296),
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "images/star.svg",
                                    height: 20,
                                    color: const Color(0xffd17842),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    rating,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Text(
                                    "(6.983)",
                                    style: TextStyle(color: Color(0xff919296)),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 42,
                                    width: 42,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff101419),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "images/coffee-beans.svg",
                                          color: const Color(0xffd17842),
                                          height: 15,
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        const Text(
                                          "Coffee",
                                          style: TextStyle(
                                              color: Color(0xff919296),
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    height: 42,
                                    width: 42,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff101419),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "images/water-drop.svg",
                                          color: const Color(0xffd17842),
                                          height: 15,
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        const Text(
                                          "Milk",
                                          style: TextStyle(
                                              color: Color(0xff919296),
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 37,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: const Color(0xff101419),
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                    child: Text(
                                  "Medium Roasted",
                                  style: TextStyle(
                                      color: Color(0xff919296),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Description",
                      style: TextStyle(
                          color: Color(0xff919296),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                          color: Color(0xff919296), fontSize: 15),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Size",
                      style: TextStyle(
                          color: Color(0xff919296),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const CoffeeSizeSelection(),
                    const SizedBox(
                      height: 27,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Price",
                              style: TextStyle(
                                  color: Color(0xff919296),
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  r'Rp.',
                                  style: TextStyle(
                                      color: Color(0xffd17842), fontSize: 21),
                                ),
                                Text(
                                  price.toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 21),
                                )
                              ],
                            )
                          ],
                        ),
                        // ignore: deprecated_member_use
                        ButtonTheme(
                          minWidth: 200,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () async {
                              await CoffeeHistoryService.addCoffeeToHistory(
                                  title, description, image, price);

                              // Show a Snackbar
                              const snackBar = SnackBar(
                                content: Text('Coffee added to history!'),
                                duration: Duration(
                                    seconds:
                                        2), // Adjust the duration as needed
                              );

                              // Show the Snackbar and navigate back when it's closed
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar)
                                  .closed
                                  .then((reason) {
                                // Navigate back when the Snackbar is closed
                                if (reason != SnackBarClosedReason.action) {
                                  Navigator.of(context).pop();
                                }
                              });
                            },
                            child: const Text(
                              "Buy Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
