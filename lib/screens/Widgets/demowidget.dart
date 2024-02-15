import 'package:flutter/material.dart';
import 'package:local_farmers_project/screens/CartProvider/addtocartmodel.dart';
import 'package:local_farmers_project/screens/CartProvider/cartaddprovider.dart';
import 'package:local_farmers_project/screens/CartProvider/cartprovider.dart';
import 'package:local_farmers_project/screens/CartScreen/mycartscreen.dart';
import 'package:local_farmers_project/screens/GlobalService/globalservice.dart';
import 'package:provider/provider.dart';



class DemoScreensss extends StatefulWidget {
  const DemoScreensss({super.key});

  @override
  State<DemoScreensss> createState() => _DemoScreensssState();
}

class _DemoScreensssState extends State<DemoScreensss> {

  bool isVisible = false;
  late AddCartItem addCartItem;

  @override
  Widget build(BuildContext context) {
    final addtocart=Provider.of<AddtoCartProvider>(context);
    final cart=Provider.of<CartProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(3),
              bottomLeft: Radius.circular(3),
              topRight: Radius.circular(1),
              bottomRight: Radius.circular(1),
            ),
          ),
          child: InkWell(
            onTap: ()async {
        final cartProvider = Provider.of<AddtoCartProvider>(context, listen: false);
final success = await cartProvider.addItemToCart(productid:addCartItem.productId.toString() ,quanity:addCartItem.quantity.toString() ,userid:addCartItem.userId.toString() ); // Assuming parameters are required for the addItemToCart method
if (success) {
  Navigator.push(context, MaterialPageRoute(builder:(context)=>const MyCartScreen()));
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('Item added to cart successfully'),
    
  ));
} else {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('Failed to add item to cart'),
  ));
}
            },
            
            // onTap: _toggleVisibility,
            child: const Icon(Icons.add, color: Colors.white, size: 13),
          ),
        ),
        if (isVisible)
          Container(
          height: 30,
          width: 30,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(3),
                bottomRight: Radius.circular(3),
              ),
            ),
            child: const Row(
              children: [
                Center(
                  child: Text(
                    '1',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 13,
                ),
              ],
            ),
          ),
      ],
    );
  }
}

