import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/CartProvider/allcartwidget.dart';
import 'package:local_farmers_project/screens/CartProvider/cartemptyscreen.dart';
import 'package:local_farmers_project/screens/CartProvider/cartprovider.dart';
import 'package:local_farmers_project/screens/ExtraScreens/loadingscreen.dart';
import 'package:provider/provider.dart';


class MyCartScreen extends StatefulWidget {

  const MyCartScreen({Key? key,}) : super(key: key);

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  
   @override
  void initState() {
    Provider.of<CartProvider>(context, listen: false)
        .getAllCartsData(context: context);
  
    super.initState();
  }
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
     final cart = Provider.of<CartProvider>(context);
    double totalPrice = cart.calculateTotalPrice();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
         leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Center(
          child: Text(
            'My Cart',
            style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
         SizedBox(
          height: 35,
          width: 120,
           child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: greencolor),
            onPressed: (){
               cart.clearCart(userid:cart.userid);
            
           }, child:const Center(child: Text('Clear Cart',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 13),))),
         )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: size.height*0.02),
                  cart.loadingSpinner
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const LoadingScreen(title: 'Loading'),
                      CircularProgressIndicator(
                        color: greencolor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                   
                    ],
                  )
                : cart.carts.isEmpty
                    ? const CartEmptyScreen()
                    : SizedBox(
                       height: size.height * 0.8,
                        child: ListView.builder(
                        
                          scrollDirection: Axis.vertical,
                          itemCount:cart.carts.length,
                          itemBuilder: (context, intex) {
                            return AllCartWidget(
                              cartid: cart.carts[intex].cartId,
                              productid: cart.carts[intex].productId,
                              name: cart.carts[intex].productName,
                              price: cart.carts[intex].price,
                              image: cart.carts[intex].image,
                              quantity: cart.carts[intex].quantity,
                              itemtotal:cart.carts[intex].itemTotal,
                              deliveryfee: cart.carts[intex].delivertfee,
  
                            
                            );
                            
                          },
                        ),
                      ),       
                  
              
                  // Card(
                  //   elevation: 0,
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(8)),
                  //   // height: size.height * 0.13,
                  //   // width: size.width,
                  //   // decoration: BoxDecoration(
                  //   //   borderRadius: BorderRadius.circular(8),
                  //   //   color: Colors.white,
                  //   // ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Image.asset(
                  //         'assets/items5.png',
                  //         scale: 4,
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.all(12),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             const Text(
                  //               'Mango',
                  //               style: TextStyle(
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //             Row(
                  //               children: [
                  //                 const Text(
                  //                   '5 pcs',
                  //                   style: TextStyle(color: Colors.grey),
                  //                 ),
                  //                 SizedBox(
                  //                   width: size.width * 0.04,
                  //                 ),
                  //                 const Countscreens(),
                  //                 SizedBox(
                  //                   width: size.width * 0.02,
                  //                 ),
                  //                 const Text(
                  //                   '₹ 10.00',
                  //                   style: TextStyle(
                  //                     fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // // SizedBox(
                  // //   height: size.height * 0.01,
                  // // ),
                  // Card(
                  //   elevation: 0,
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(8)),
                  //   // height: size.height * 0.13,
                  //   // width: size.width,
                  //   // decoration: BoxDecoration(
                  //   //   borderRadius: BorderRadius.circular(8),
                  //   //   color: Colors.white,
                  //   // ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Image.asset('assets/items7.png', scale: 4),
                  //       Padding(
                  //         padding: const EdgeInsets.all(12),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             const Text(
                  //               'Tender Coconut',
                  //               style: TextStyle(
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //             Row(
                  //               children: [
                  //                 const Text(
                  //                   '5 pcs',
                  //                   style: TextStyle(color: Colors.grey),
                  //                 ),
                  //                 SizedBox(
                  //                   width: size.width * 0.04,
                  //                 ),
                  //                 const Countscreens(),
                  //                 SizedBox(
                  //                   width: size.width * 0.02,
                  //                 ),
                  //                 const Text(
                  //                   '₹ 4.50',
                  //                   style: TextStyle(
                  //                     fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // // SizedBox(
                  // //   height: size.height * 0.01,
                  // // ),
                  // Card(
                  //   elevation: 0,
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(8)),
                  //   // height: size.height * 0.13,
                  //   // width: size.width,
                  //   // decoration: BoxDecoration(
                  //   //   borderRadius: BorderRadius.circular(8),
                  //   //   color: Colors.white,
                  //   // ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Image.asset('assets/items8.png', scale: 4),
                  //       Padding(
                  //         padding: const EdgeInsets.all(12),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             const Text(
                  //               'Watermelon',
                  //               style: TextStyle(
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //             Row(
                  //               children: [
                  //                 const Text(
                  //                   '5 pcs',
                  //                   style: TextStyle(color: Colors.grey),
                  //                 ),
                  //                 SizedBox(
                  //                   width: size.width * 0.04,
                  //                 ),
                  //                 const Countscreens(),
                  //                 SizedBox(
                  //                   width: size.width * 0.02,
                  //                 ),
                  //                 const Text(
                  //                   '₹ 10.00',
                  //                   style: TextStyle(
                  //                     fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: size.height * 0.03,
                  // ),
                
                
                ],
              ),
            ),
          ),
          Container(
            color: Colors.grey[100],
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // shape: const RoundedRectangleBorder(
                //     borderRadius: BorderRadius.only(
                //         topLeft: Radius.circular(25),
                //         topRight: Radius.circular(25))),
                height: size.height * 0.18,
          
                width: size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          const Text(
                            'Item Total',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.fade,
                          ),
                           Text(
                            '₹ ${totalPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: greencolor,
                              fontWeight: FontWeight.w900,
                            ),
                            overflow: TextOverflow.fade,
                          ),
                        
                        
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Delivery fee',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '₹',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                      ),
                                    ),
                                    Icon(
                                      Icons.label_important_outline,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         const PaymentMethodScreen(),
                                //   ),
                                // );
                              },
                              child: Container(
                                height: size.height * 0.05,
                                width: size.width * 0.5,
                                decoration: BoxDecoration(
                                  color: greencolor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Continue To Pay',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ), 
        
 
        ],
      ),
    );
  }
 
}