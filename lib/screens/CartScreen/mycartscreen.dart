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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Item Total',),
                          Text('100.00')
                        ],
                      )
              
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
        
 
        ],
      ),
    );
  }
 
}