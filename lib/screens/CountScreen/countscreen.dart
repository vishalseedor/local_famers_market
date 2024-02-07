import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';

class Countscreens extends StatefulWidget {
  const Countscreens({Key? key}) : super(key: key);

  @override
  State<Countscreens> createState() => _CountscreensState();
}

class _CountscreensState extends State<Countscreens> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      color: greencolor,
      child: SizedBox(
        height: size.height * 0.04,
        width: size.width * 0.16,
        child: quantity == 0
            ? TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.remove,
                      size: 18,
                      color: Colors.white,
                    ),
                    Text(
                      '1',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    Icon(
                      Icons.add,
                      size: 18,
                      color: Colors.white,
                    )
                  ],
                ),
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                },
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        quantity--;
                      });
                    },
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  Text(
                    quantity.toString(),
                    style: const TextStyle(
                      color: Colors.white, // Set the text color to white
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    child: const Icon(
                      Icons.add,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
