import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/ExtraScreens/loadingscreen.dart';
import 'package:local_farmers_project/screens/MyOrderScreen/api/orderprovider.dart';
import 'package:local_farmers_project/screens/MyOrderScreen/design/orderemptyscreen.dart';
import 'package:local_farmers_project/screens/MyOrderScreen/widgets/orderwidget.dart';
import 'package:local_farmers_project/screens/UserProvider/userprovider.dart';



import 'package:provider/provider.dart';


class OrdersScreen extends StatefulWidget { 
   static const routeName = 'all_orders_screen';
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
    @override
  void initState() {
     final userProvider = Provider.of<UserProvider>(context, listen: false);
    Provider.of<Orderprovider>(context, listen: false)
        .getAllOrdersData(context: context,userid: userProvider.currentUserId);
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final order=Provider.of<Orderprovider>(context);
    return Scaffold(
       backgroundColor: backgroundcolor,
        appBar: AppBar(
          toolbarHeight: 80,
          title: const Text(
            'My Orders',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey[100],
          elevation: 0,
        ),
    body:order.loadingSpinner
                  ? const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoadingScreen(title: 'Loading'),
                        CircularProgressIndicator(
                          color:Colors.green,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                     
                      ],
                    )
                  : order.orders.isEmpty
                      ? const Orderemptyscreen()
                      : SizedBox(
                         // height: size.height * 0.6,
                          child: ListView.builder(
            itemCount: order.orders.length,
          
           
            itemBuilder: (context, index) {
              return Orderwidget(
                orderid: order.orders[index].billingId,
                orderStatus: order.orders[index].orderStatus,
                ordercreation: order.orders[index].orderCreated,
                cartid: order.orders[index].cartId,
                cartquantity: order.orders[index].cartQuantity,
                productname: order.orders[index].productName,
                productid: order.orders[index].productId,
                productdescription:order.orders[index].productDescription,
                price: order.orders[index].productPrice,



                );
            },
          )
                        ),  
    );
  }
}