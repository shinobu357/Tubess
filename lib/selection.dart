import 'package:flutter/material.dart';

class CoffeeSizeSelection extends StatefulWidget {
  const CoffeeSizeSelection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CoffeeSizeSelectionState createState() => _CoffeeSizeSelectionState();
}

class _CoffeeSizeSelectionState extends State<CoffeeSizeSelection> {
  int selectedSize = 0; // 0 for 'S', 1 for 'M', 2 for 'L'

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(3, (i) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedSize = i;
              });
            },
            child: Container(
              height: 37,
              width: 110,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color:
                    selectedSize == i ? Colors.black : const Color(0xff101419),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xffd17842)),
              ),
              child: Center(
                child: Text(
                  i == 0
                      ? "S"
                      : i == 1
                          ? "M"
                          : "L",
                  style: const TextStyle(
                    color: Color(0xff919296),
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
