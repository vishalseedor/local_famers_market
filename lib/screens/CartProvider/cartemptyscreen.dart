import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/SideBottomNavigation/sidebottomnavigation.dart';


class CartEmptyScreen extends StatefulWidget {
  const CartEmptyScreen({super.key});

  @override
  State<CartEmptyScreen> createState() => _CartEmptyScreenState();
}

class _CartEmptyScreenState extends State<CartEmptyScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 80),
          Image.asset('assets/cartempty.gif',scale: 1.8),
          const Center(child: Text('Your Cart is Empty....!',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
          SizedBox(height: size.height*0.01),
           const Center(child: Text('Explore our ever growing selection of products.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),),
          SizedBox(height: size.height*0.01),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: greencolor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>const SideBottomNavigation()));
            }, child:Text('Start Purchase',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))

        ],
      );
    

  }
}