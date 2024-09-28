import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/CartProvider/cartprovider.dart';
import 'package:local_farmers_project/screens/UserProvider/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class AllCartWidget extends StatefulWidget {
  final String cartid;
  final String productid;
  final int index;
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
      required this.index,
      required this.image,
      required this.quantity,
      required this.price,
      required this.itemtotal,
     });

  @override
  State<AllCartWidget> createState() => _AllCartWidgetState();
}

class _AllCartWidgetState extends State<AllCartWidget> {
  int quanity = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cart = Provider.of<CartProvider>(context);
    final userData = Provider.of<UserProvider>(context);
    int itemTotal = int.parse(widget.price) * quanity;

    //  final pet = Provider.of<PetModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.grey[200],
        elevation: 7,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                color:const Color.fromARGB(255, 200, 221, 201),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(widget.image,height: 90,width: 90),
                )),
              Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                  SizedBox(height: size.height*0.01),
                  Text('₹ : ${int.parse(widget.price) * quanity}',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 13),),
                   SizedBox(height: size.height*0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: 35,
                          width: 85,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 200, 221, 201),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              
                                InkWell(
                                    onTap: ()async {
                                      if (quanity > 1) {
                                      setState(() {
                                        quanity--;
                                      });
                                      // Call the API to update quantity with status 'decrement'
                                      await cart.updateCartQuantity(
                                        cartId: widget.cartid,  // Pass the cart ID
                                        newQuantity: quanity,
                                        status: 'decrement',
                                      );
                                                    
                                      // Update the cart locally
                                      cart.updateQuantity(widget.index, quanity.toString());
                                    }
                                      // setState(() {
                                      //    quanity--;
                                      //   cart.updateQuantity(widget.index, quanity.toString());
                                                    
                                      // });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: greencolor,
                                    )),
                                Text(
                                  quanity.toString(),
                                  style: TextStyle(color:greencolor,fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                    onTap: ()async {
                                      setState(() {
                                      quanity++;
                                    });
                                    // Call the API to update quantity with status 'increment'
                                    await cart.updateCartQuantity(
                                      cartId: widget.cartid,  // Pass the cart ID
                                      newQuantity: quanity,
                                      status: 'increment',
                                    );
                                                    
                                    // Update the cart locally
                                    cart.updateQuantity(widget.index, quanity.toString());
                                      // setState(() {
                                      //   quanity++;
                                      //   cart.updateQuantity(widget.index, quanity.toString());
                                                    
                                      // });
                                    },
                                    child:  Icon(
                                      Icons.add,
                                      color: greencolor,
                                    )),
                                                //                SizedBox(
                                                //   width: size.width * 0.03,
                                                // ),
                                               
                                  
                                               
                              ],
                            ),
                          ),
                        ),
                      SizedBox(width: 40),
                      Container(
                        height: 35,
                        width: 50,
                        
                        decoration: BoxDecoration(color:const Color.fromARGB(255, 200, 221, 201),borderRadius: BorderRadius.circular(5)),
                        child:  GestureDetector(
                          onTap: () {
                            print(widget.cartid);
                          cart.deleteCart(widget.cartid, context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: greencolor,
                              content: const Text(
                                'Cart item Deleted successfully!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              duration: const Duration(seconds: 4),
                            ), 
                          );
                          },
                          child: Icon(
                            IconlyBold.delete,
                            color: greencolor
                          ),
                        )
                      )
          
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      
      ),
    );

    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    //   child: Column(
    //     children: [
    //       Card(
    //         elevation: 0,
    //         shape:
    //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    //         // height: size.height * 0.13,
    //         // width: size.width,
    //         // decoration: BoxDecoration(
    //         //   borderRadius: BorderRadius.circular(8),
    //         //   color: Colors.white,
    //         // ),
    //         child: Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             children: [
    //               Image.network(
    //                 widget.image,
    //                 height: 70,
    //                 width: 70,
    //               ),
                  
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     widget.name,
    //                     style: const TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                     maxLines: 2,
    //                   ),
    //                   Text(
    //                 '₹${int.parse(widget.price) * quanity}',
    //                 style: const TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //                Row(
    //                 children: [
    //                   Container(
    //                     height: 35,
    //                     width: 80,
    //                     decoration: BoxDecoration(
    //                         color: greencolor,
    //                         borderRadius: BorderRadius.circular(5)),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                       children: [
    //                         InkWell(
    //                             onTap: ()async {
    //                               if (quanity > 1) {
    //                               setState(() {
    //                                 quanity--;
    //                               });
    //                               // Call the API to update quantity with status 'decrement'
    //                               await cart.updateCartQuantity(
    //                                 cartId: widget.cartid,  // Pass the cart ID
    //                                 newQuantity: quanity,
    //                                 status: 'decrement',
    //                               );
                      
    //                               // Update the cart locally
    //                               cart.updateQuantity(widget.index, quanity.toString());
    //                             }
    //                               // setState(() {
    //                               //    quanity--;
    //                               //   cart.updateQuantity(widget.index, quanity.toString());
                      
    //                               // });
    //                             },
    //                             child: Icon(
    //                               Icons.remove,
    //                               color: Colors.white,
    //                             )),
    //                         Text(
    //                           quanity.toString(),
    //                           style: TextStyle(color: Colors.white),
    //                         ),
    //                         InkWell(
    //                             onTap: ()async {
    //                               setState(() {
    //                               quanity++;
    //                             });
    //                             // Call the API to update quantity with status 'increment'
    //                             await cart.updateCartQuantity(
    //                               cartId: widget.cartid,  // Pass the cart ID
    //                               newQuantity: quanity,
    //                               status: 'increment',
    //                             );
                      
    //                             // Update the cart locally
    //                             cart.updateQuantity(widget.index, quanity.toString());
    //                               // setState(() {
    //                               //   quanity++;
    //                               //   cart.updateQuantity(widget.index, quanity.toString());
                      
    //                               // });
    //                             },
    //                             child: const Icon(
    //                               Icons.add,
    //                               color: Colors.white,
    //                             )),
    //                              SizedBox(
    //                 width: size.width * 0.03,
    //               ),
                 

    //               IconButton(
    //                   onPressed: () {
    //                     print(widget.cartid);
    //                     cart.deleteCart(widget.cartid, context);
    //                     ScaffoldMessenger.of(context).showSnackBar(
    //                       SnackBar(
    //                         backgroundColor: greencolor,
    //                         content: const Text(
    //                           'Cart item Deleted successfully!',
    //                           style: TextStyle(
    //                               color: Colors.white,
    //                               fontWeight: FontWeight.bold),
    //                         ),
    //                         duration: const Duration(seconds: 4),
    //                       ), 
    //                     );
    //                   },
    //                   icon: Icon(IconlyLight.delete)),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //                 ],
    //               ),
                

                 
                 
    //             ],
    //           ),
    //         ),
    //       ),
         
    //     ],
    //   ),
    // );
  }
    void handlePaymentErrorResponse(PaymentFailureResponse response){
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response){
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response){
    showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message){
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed:  () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

//   void handlePaymentErrorResponse(PaymentFailureResponse response) {
//     /*
//     * PaymentFailureResponse contains three values:
//     * 1. Error Code
//     * 2. Error Description
//     * 3. Metadata
//     * */
//     showAlertDialog(context, "Payment Failed",
//         "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
//   }

//   void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
//     /*
//     * Payment Success Response contains three values:
//     * 1. Order ID
//     * 2. Payment ID
//     * 3. Signature
//     * */
//     print(response.data.toString());
//     showAlertDialog(
//         context, "Payment Successful", "Payment ID: ${response.paymentId}");
//   }

//   void handleExternalWalletSelected(ExternalWalletResponse response) {
//     showAlertDialog(
//         context, "External Wallet Selected", "${response.walletName}");
//   }

//   void showAlertDialog(BuildContext context, String title, String message) {
//     // set up the buttons
//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text(title),
//       content: Text(message),
//     );
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
// }
