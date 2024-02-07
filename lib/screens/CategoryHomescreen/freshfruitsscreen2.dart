import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../ItemDetailsScreen/itemdetailsscreen.dart';
import '../Widgets/itemwidget.dart';

class FreshFruitsScreen2 extends StatefulWidget {
  const FreshFruitsScreen2({super.key});

  @override
  State<FreshFruitsScreen2> createState() => _FreshFruitsScreen2State();
}

class _FreshFruitsScreen2State extends State<FreshFruitsScreen2> {
  String dropdownvalue = 'Fruits & Vegtables';
  var items = [
    'Fruits & Vegtables',
    'Cooking Essentails',
    'Nut & Dry Fruits',
    'Dairy Products',
    'Drinks & Beverages',
    'Ice Cream Desserts',
    'Chocolates & Candies',
    'Meat,Fish & Eggs',
    'Personal Care',
    'Health & Hygiene',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Container(
                    height: size.height * 0.06,
                    width: size.width * 0.9,
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text(
                          'Select Item',
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: dropdownvalue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    )),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ItemWidget(
                            productName: 'Watermelon',
                            image: 'assets/items8.png',
                            itemcount: '1pc',
                            price: '5.00',
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const ItemDetailScreen()));
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        //Spacer(),
                        Expanded(
                          child: ItemWidget(
                            productName: 'Mango',
                            image: 'assets/items5.png',
                            itemcount: '1pc',
                            price: '5,00',
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const ItemDetailScreen()));
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.004,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ItemWidget(
                            productName: 'Tender Coconut',
                            image: 'assets/items7.png',
                            itemcount: '1pc',
                            price: '6.00',
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const ItemDetailScreen()));
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: ItemWidget(
                            productName: 'Muskmelon',
                            image: 'assets/items6.png',
                            itemcount: '1pc',
                            price: '4.50',
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const ItemDetailScreen()));
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.004,
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ItemWidget(
                            productName: 'Fresh Kiwi',
                            image: 'assets/items3.png',
                            itemcount: '1pc',
                            price: '5.70',
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const ItemDetailScreen()));
                            },
                          ),
                        ),
                        const SizedBox(width: 3),
                        Expanded(
                          child: ItemWidget(
                            productName: 'Jackfruit',
                            image: 'assets/items2.png',
                            itemcount: '1pc',
                            price: '2.50',
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const ItemDetailScreen()));
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.004,
                    ),
                    Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ItemWidget(
                            productName: 'Green Mango',
                            image: 'assets/items4.png',
                            itemcount: '1pc',
                            price: '6.00',
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const ItemDetailScreen()));
                            },
                          ),
                        ),
                        const SizedBox(width: 3),
                        Expanded(
                          child: ItemWidget(
                            productName: 'Coconut',
                            image: 'assets/items1.png',
                            itemcount: '1pc',
                            price: '5,00',
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const ItemDetailScreen()));
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.004,
                ),
                Column(
                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ItemWidget(
                            productName: 'Watermelon',
                            image: 'assets/items8.png',
                            itemcount: '1pc',
                            price: '5.00',
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const ItemDetailScreen()));
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: ItemWidget(
                            productName: 'Mango',
                            image: 'assets/items5.png',
                            itemcount: '1pc',
                            price: '5,00',
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const ItemDetailScreen()));
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.004,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ItemWidget(
                            productName: 'Tender Coconut',
                            image: 'assets/items7.png',
                            itemcount: '1pc',
                            price: '6.00',
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const ItemDetailScreen()));
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: ItemWidget(
                            productName: 'Muskmelon',
                            image: 'assets/items6.png',
                            itemcount: '1pc',
                            price: '4.50',
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const ItemDetailScreen()));
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.004,
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ItemWidget(
                            productName: 'Fresh Kiwi',
                            image: 'assets/items3.png',
                            itemcount: '1pc',
                            price: '5.70',
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const ItemDetailScreen()));
                            },
                          ),
                        ),
                        const SizedBox(width: 3),
                        Expanded(
                          child: ItemWidget(
                            productName: 'Jackfruit',
                            image: 'assets/items2.png',
                            itemcount: '1pc',
                            price: '2.50',
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const ItemDetailScreen()));
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.004,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ItemWidget(
                            productName: 'Green Mango',
                            image: 'assets/items4.png',
                            itemcount: '1pc',
                            price: '6.00',
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const ItemDetailScreen()));
                            },
                          ),
                        ),
                        const SizedBox(width: 3),
                        Expanded(
                          child: ItemWidget(
                            productName: 'Coconut',
                            image: 'assets/items1.png',
                            itemcount: '1pc',
                            price: '5,00',
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const ItemDetailScreen()));
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
