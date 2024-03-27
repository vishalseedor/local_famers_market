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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          Card(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            // height: size.height * 0.13,
            // width: size.width,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(8),
            //   color: Colors.white,
            // ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    widget.image,
                    height: 70,
                    width: 70,
                  ),
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                  // Text(
                  //   '${widget.quantity} pcs',
                  //   style: const TextStyle(color: Colors.grey),
                  // ),

                  Container(
                    height: 35,
                    width: 80,
                    decoration: BoxDecoration(
                        color: greencolor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                 quanity--;
                                cart.updateQuantity(widget.index, quanity.toString());

                              });
                            },
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            )),
                        Text(
                          quanity.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                quanity++;
                                cart.updateQuantity(widget.index, quanity.toString());

                              });
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Text(
                    '₹${int.parse(widget.price) * quanity}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  IconButton(
                      onPressed: () {
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
                      icon: Icon(IconlyLight.delete)),
                ],
              ),
            ),
          ),
          //           Card(
          //   elevation: 0,
          //   shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(7)),
          //   // height: size.height * 0.13,
          //   // width: size.width,
          //   // color: Colors.white,
          //   child:  Padding(
          //     padding: EdgeInsets.all(15),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             const Text(
          //               'Item Total',
          //               style: TextStyle(
          //                 fontSize: 14,
          //                 fontWeight: FontWeight.w500,
          //               ),
          //             ),
          //             Text(
          //              '₹ ${itemTotal}',
          //               style: const TextStyle(
          //                 fontSize: 14,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ],
          //         ),
          //          Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             const Text(
          //               'Delivery Fee',
          //               style: TextStyle(
          //                 fontSize: 14,
          //                 fontWeight: FontWeight.w500,
          //               ),
          //             ),
          //             Text(
          //               '₹ ${widget.deliveryfee}',
          //               style: const TextStyle(
          //                 fontSize: 14,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ],
          //         ),

          //       ],
          //     ),
          //   ),
          // ),
          // Card(
          //   elevation: 0,
          //   shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(6)),
          //   // height: size.height * 0.080,
          //   // width: size.width,
          //   // color: Colors.white,
          //   child: Padding(
          //     padding: const EdgeInsets.all(23),
          //     child: Column(
          //       children: [
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               'Amount To Pay',
          //               style: TextStyle(
          //                 fontSize: 14,
          //                 fontWeight: FontWeight.bold,
          //                 color: greencolor,
          //               ),
          //             ),
          //              Text(
          //               '₹ ${widget.itemtotal*2}',
          //               style: TextStyle(
          //                 fontSize: 14,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 30),
          //  InkWell(
          //            onTap: () {
          //            Razorpay razorpay = Razorpay();
          //                    var options = {
          //   'key': 'rzp_test_1DP5mmOlF5G5ag',
          //   'amount': 100,
          //   'name': 'Acme Corp.',
          //   'description': 'Fine T-Shirt',
          //   'retry': {'enabled': true, 'max_count': 1},
          //   'send_sms_hash': true,
          //   'prefill': {
          //     'contact': '8888888888',
          //     'email': 'test@razorpay.com'
          //   },
          //   'external': {
          //     'wallets': ['paytm']
          //   }
          //                    };
          //                    razorpay.on(
          //     Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
          //                    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
          //     handlePaymentSuccessResponse);
          //                    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
          //     handleExternalWalletSelected);
          //                    razorpay.open(options);
          //            },
          //             child: Container(
          //              alignment: Alignment.bottomCenter,
          //              height: 65,
          //              width: double.infinity,
          //              decoration: BoxDecoration( color: greencolor,borderRadius: BorderRadius.circular(10)),

          //              child: const Center(
          //                child:
          //                Row(
          //                  mainAxisAlignment: MainAxisAlignment.center,
          //                  children: [
          //                    Icon(Icons.check_circle,color: Colors.white,size: 40,),
          //                    SizedBox(width: 5,),
          //                    Text('Check out',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
          //                  ],
          //                ),
          //              ),
          //             ),
          //           )
        ],
      ),
    );
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    print(response.data.toString());
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
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
