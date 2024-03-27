import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/CartProvider/allcartwidget.dart';
import 'package:local_farmers_project/screens/CartProvider/cartemptyscreen.dart';
import 'package:local_farmers_project/screens/CartProvider/cartprovider.dart';
import 'package:local_farmers_project/screens/ExtraScreens/loadingscreen.dart';
import 'package:local_farmers_project/screens/UserProvider/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class MyCartScreen extends StatefulWidget {
  MyCartScreen({Key? key}) : super(key: key);

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  Map<String,dynamic>?paymentIntent;
  @override
  void initState() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    Provider.of<CartProvider>(context, listen: false)
        .getAllCartsData(context: context, userid: userProvider.currentUserId);
    Provider.of<UserProvider>(context, listen: false)
        .getUsertData(context: context);

    super.initState();
  }

  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final userData = Provider.of<UserProvider>(context);
    double totalPrice = cart.calculateTotalPrice();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: false,
        backgroundColor: greencolor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'My Cart',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 35,
              width: 100,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    cart.clearCart(userid: userData.currentUserId);
                  },
                  child: Center(
                      child: Text(
                    'Clear',
                    style: TextStyle(
                        color: greencolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ))),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.02),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1500),
                    child: cart.loadingSpinner
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
                                  itemCount: cart.carts.length,
                                  itemBuilder: (context, intex) {
                                    return AllCartWidget(
                                      index: intex,
                                      cartid: cart.carts[intex].cartId,
                                      productid: cart.carts[intex].productId,
                                      name: cart.carts[intex].productName,
                                      price: cart.carts[intex].price,
                                      image: cart.carts[intex].image,
                                      quantity: cart.carts[intex].quantity,
                                      itemtotal: cart.carts[intex].itemTotal,
                                    
                                    );
                                  },
                                ),
                              ),
                  ),
                ],
              ),
            ),
          ),
          cart.carts.isEmpty
              ? const Text('')
              : Container(
                  color: Colors.grey[100],
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      // shape: const RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.only(
                      //         topLeft: Radius.circular(25),
                      //         topRight: Radius.circular(25))),
                      height: size.height * 0.15,

                      width: size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: size.height * 0.01),
                            Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  "₹ .${cart.calculateTotalPrice().toString()}",
                                  style: TextStyle(
                                    color: greencolor,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  overflow: TextOverflow.fade,
                                ),
                              ],
                            ),
                         //   SizedBox(height: size.height*0.01),
                            //   Row(
                            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     const Text(
                            //       'Delivery Fee',
                            //       style: TextStyle(
                            //         color: Colors.white,
                            //         fontWeight: FontWeight.w600,
                            //       ),
                            //       overflow: TextOverflow.fade,
                            //     ),
                            //     Text(
                            //       "₹ .50.00",
                            //       style: TextStyle(
                            //         color: greencolor,
                            //         fontWeight: FontWeight.w900,
                            //       ),
                            //       overflow: TextOverflow.fade,
                            //     ),
                            //   ],
                            // ),
                            //SizedBox(height: size.height * 0.02),
                            GestureDetector(
                              onTap: (){
                              //  payment();
                                Razorpay razorpay = Razorpay();
                                var options = {
                                  'key': 'rzp_test_1DP5mmOlF5G5ag',
                                  'amount': cart.totalAmount * 100,
                                  'name': 'Local Farmers Market',
                                  'description': 'Fine T-Shirt',
                                  'retry': {
                                    'enabled': true,
                                    'max_count': 1
                                  },
                                  'send_sms_hash': true,
                                  'prefill': {
                                    'contact': '8888888888',
                                    'email': 'test@razorpay.com'
                                  },
                                  'external': {
                                    'wallets': ['paytm']
                                  }
                                };
                                razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                                    handlePaymentErrorResponse);
                                razorpay.on(
                                    Razorpay.EVENT_PAYMENT_SUCCESS,
                                    handlePaymentSuccessResponse);
                                razorpay.on(
                                    Razorpay.EVENT_EXTERNAL_WALLET,
                                    handleExternalWalletSelected);
                                razorpay.open(options);
                              },
                              child: Container(
                                height: size.height * 0.05,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: greencolor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Place Order',
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
                    ),
                  ),
                ),
        ],
      ),
    );
  }
// Future<void>payment()async{
// try{
//   Map<String ,dynamic>body={

//     'amount':100.00,
//     'currency':'INR',

//   };
//   var response =await http.post(
//     Uri.parse('https://api.stripe.com/v1/payment_intents'),
//     headers:{
//       'Authorization':'Bearer',
//       'Content-type':'application/x-www-form-urlencoded'

//     }
//   );
//   paymentIntent=json.decode(response.body);
// }catch(error){
//   throw Exception(error);
// }
//  await Stripe.instance.initPaymentSheet(paymentSheetParameters:SetupPaymentSheetParameters(
//   paymentIntentClientSecret: paymentIntent!['client_secret'],
//   style: ThemeMode.light,
//   merchantDisplayName: 'Vishal'
//  )
//  ).then((value) => {});
//  try{
//   await Stripe.instance.presentPaymentSheet().then((value) =>{
//     print('Payment successfully')
//   } );
//  }catch(error){

//  }

//   }

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

  void handlePaymentSuccessResponse(PaymentSuccessResponse response){

   context.read<CartProvider>().placeOrderApi(context: context);
    print(response.data.toString());
  
  
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
