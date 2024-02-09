import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/CartProvider/allcartwidget.dart';
import 'package:local_farmers_project/screens/CartProvider/cartprovider.dart';
import 'package:local_farmers_project/screens/ExtraScreens/loadingscreen.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key}) : super(key: key);

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
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'My Cart',
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
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
                    ? const Center(child: Text('No Carts...'))
                    : SizedBox(
                        height: size.height * 0.5,
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
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                    // height: size.height * 0.13,
                    // width: size.width,
                    // color: Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Item Total',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '₹ 19.50',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery Fee',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '₹ 2.00',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Additional Fee',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '₹ 10.00',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    // height: size.height * 0.080,
                    // width: size.width,
                    // color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(23),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Amount To Pay',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: greencolor,
                                ),
                              ),
                              const Text(
                                '₹ 31.00',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
         InkWell(
          onTap: () {
          Razorpay razorpay = Razorpay();
                  var options = {
                    'key': 'rzp_test_1DP5mmOlF5G5ag',
                    'amount': 100,
                    'name': 'Acme Corp.',
                    'description': 'Fine T-Shirt',
                    'retry': {'enabled': true, 'max_count': 1},
                    'send_sms_hash': true,
                    'prefill': {
                      'contact': '8888888888',
                      'email': 'test@razorpay.com'
                    },
                    'external': {
                      'wallets': ['paytm']
                    }
                  };
                  razorpay.on(
                      Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
                  razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                      handlePaymentSuccessResponse);
                  razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                      handleExternalWalletSelected);
                  razorpay.open(options);
          },
           child: Container(
            alignment: Alignment.bottomCenter,
            height: 65,
            width: double.infinity,
            color: greencolor,
            child: Center(
              child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.delivery_dining,color: Colors.white,size: 40,),
                  SizedBox(width: 5,),
                  Text('Order Now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                ],
              ),
            ),
           ),
         )
 
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
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
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
