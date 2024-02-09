import 'package:flutter/material.dart';
import 'package:local_farmers_project/screens/CountScreen/countscreen.dart';



class AllCartWidget extends StatefulWidget {
  final String cartid;
  final String productid;
  final String name;
  final String image;
  final String quantity;
  final String price;
  final String itemtotal;
 
  

  const AllCartWidget(
      {super.key,
     required this.cartid,
     required this.productid,
     required this.name,
     required this.image,
     required this.quantity,
     required this.price,
     required this.itemtotal
     
    
      });

  @override
  State<AllCartWidget > createState() => _AllCartWidgetState ();
}

class _AllCartWidgetState extends State<AllCartWidget > {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //  final pet = Provider.of<PetModel>(context);

     return      Padding(
       padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
       child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        // height: size.height * 0.13,
                        // width: size.width,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(8),
                        //   color: Colors.white,
                        // ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/items8.png',
                              scale: 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                       Text(
                                        '${widget.quantity} pcs',
                                        style: const TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.04,
                                      ),
                                      const Countscreens(),
                                      SizedBox(
                                        width: size.width * 0.05,
                                      ),
                                       Text(
                                        '₹ ${widget.itemtotal}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
     );
  }
}
