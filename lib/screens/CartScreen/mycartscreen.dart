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

   @override
  void initState() {
     final userProvider = Provider.of<UserProvider>(context, listen: false);
    Provider.of<CartProvider>(context, listen: false)
        .getAllCartsData(context: context,userid: userProvider.currentUserId);
    Provider.of<UserProvider>(context,listen: false)
        .getUsertData(context: context);

    super.initState();
  }
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
     final cart = Provider.of<CartProvider>(context);
     final userData=Provider.of<UserProvider>(context);
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
        backgroundColor:greencolor,
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
          style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),
        ),
        actions: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: SizedBox(
            height: 35,
            width: 100,
             child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor:Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              onPressed: (){
                cart.clearCart(userid: userData.currentUserId);
             }, child:Center(child: Text('Clear',style: TextStyle(color:greencolor,fontWeight: FontWeight.bold,fontSize: 14),))),
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
                              index: intex,
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





                ],
              ),
            ),
          ),
      cart.carts.isEmpty
                    ? const Text('')
                    :
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
                            cart.calculateTotalPrice().toString(),
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
                                      '₹ 50.0',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,fontWeight: FontWeight.bold
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Razorpay razorpay = Razorpay();
                  var options = {
                    'key': 'rzp_test_1DP5mmOlF5G5ag',
                    'amount': cart.totalAmount*100,
                    'name': 'Local Farmers Market',
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
                                height: size.height * 0.05,
                                width: size.width * 0.5,
                                decoration: BoxDecoration(
                                  color: greencolor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Check Out',
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


