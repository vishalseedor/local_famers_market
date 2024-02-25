import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/CartProvider/cartaddprovider.dart';
import 'package:local_farmers_project/screens/CartProvider/cartprovider.dart';
import 'package:local_farmers_project/screens/CartScreen/cartscreen.dart';
import 'package:local_farmers_project/screens/CartScreen/mycartscreen.dart';
import 'package:local_farmers_project/screens/ViewProducts%20Provider/productprovider.dart';


import 'package:provider/provider.dart';



class ItemDetailScreen extends StatefulWidget {
   static const routeName = 'product_details_screen';
  final String id;
  const ItemDetailScreen({Key? key,required this.id}) : super(key: key);

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  
   @override
  void initState() {
    Provider.of<CartProvider>(context, listen: false)
        .getAllCartsData(context: context);
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
      final products = Provider.of<ProductProvider>(context,listen: false);
      final cartapi=Provider.of<AddtoCartProvider>(context);
      final productData =
        Provider.of<ProductProvider>(context).products.firstWhere((element) => element.productId == widget.id);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
            icon: const Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                  size: 28,
                ),
                Positioned(
                  top: 7,
                  bottom: 1,
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  productData.image,
                  height: size.height * 0.3, // Responsive image height
                  width: size.width * 0.8, // Responsive image width
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                productData.productName,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
               SizedBox(height: size.height * 0.01),
              Text(
                'Quantity : ${productData.quantity}',
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
               SizedBox(height: size.height * 0.01),
              Text('Category : ${productData.category}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900,color: Colors.brown),),
              SizedBox(height: size.height * 0.01),
              Text('Farmer : ${productData.farmer}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
               SizedBox(height: size.height * 0.01),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '₹ ${productData.price}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                // const DemoScreensss()
                ],
              ),
              SizedBox(height: size.height * 0.02),
              const Text(
                'About product',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                productData.description,
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              InkWell(
                onTap: ()async {
                         cartapi.addItemToCart(productid: productData.productId.toString(), quanity:productData.quantity.toString()); 
                                ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          backgroundColor: greencolor,
          content: const Text('Item added to cart successfully!',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          duration: const Duration(seconds: 4),
        ),
      );
                             await Navigator.push(context,MaterialPageRoute(builder: (context)=>const MyCartScreen()));
                  
                },
                child: Container(
                  height: 60,
                  
                  width: double.infinity,
                  decoration: BoxDecoration(color: greencolor,borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(IconlyBold.bag,color: Colors.white),
                      SizedBox(width: size.width*0.02,),
                      Text('Add to Cart',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)
                    ],
                  ),
                ),
              )
              // Card(
              //   color: Colors.grey[200],
              //   shape: const RoundedRectangleBorder(
              //       borderRadius: BorderRadius.only(
              //           topLeft: Radius.circular(15),
              //           topRight: Radius.circular(15))),
              //   // height: size.height * 0.27,
              //   // width: size.width,
              //   // decoration: BoxDecoration(
              //   //   color: Colors.grey[100],
              //   //   borderRadius: BorderRadius.only(
              //   //     topLeft: Radius.circular(15),
              //   //     topRight: Radius.circular(15),
              //   //   ),
              //   // ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(12),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         const Text(
              //           'Similar Products',
              //           style: TextStyle(
              //             fontSize: 16,
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //         SizedBox(height: size.height * 0.01),
              //         SingleChildScrollView(
              //           scrollDirection: Axis.horizontal,
              //           child: Row(
              //             children: [
              //               ItemWidget(
              //                 productName: 'Watermelon',
              //                 image: 'assets/items8.png',
              //                 itemcount: '1pc',
              //                 price: '5.00',
              //                 onTap: () {},
              //               ),
              //               SizedBox(width: size.width * 0.03),
              //               ItemWidget(
              //                 productName: 'Mango',
              //                 image: 'assets/items5.png',
              //                 itemcount: '1pc',
              //                 price: '5.00',
              //                 onTap: () {},
              //               ),
              //               SizedBox(width: size.width * 0.03),
              //               ItemWidget(
              //                 productName: 'Tender Coconut',
              //                 image: 'assets/items7.png',
              //                 itemcount: '1pc',
              //                 price: '5.00',
              //                 onTap: () {},
              //               ),
              //               SizedBox(width: size.width * 0.03),
              //               ItemWidget(
              //                 productName: 'Muskmelon',
              //                 image: 'assets/items6.png',
              //                 itemcount: '1pc',
              //                 price: '5.00',
              //                 onTap: () {},
              //               ),
              //               SizedBox(width: size.width * 0.03),
              //               ItemWidget(
              //                 productName: 'Fresh Kiwi',
              //                 image: 'assets/items3.png',
              //                 itemcount: '1pc',
              //                 price: '5.00',
              //                 onTap: () {},
              //               ),
              //               SizedBox(width: size.width * 0.03),
              //               ItemWidget(
              //                 productName: 'Jackfruit',
              //                 image: 'assets/items2.png',
              //                 itemcount: '1pc',
              //                 price: '5.00',
              //                 onTap: () {},
              //               ),
              //               SizedBox(width: size.width * 0.03),
              //               ItemWidget(
              //                 productName: 'Green Mango',
              //                 image: 'assets/items4.png',
              //                 itemcount: '1pc',
              //                 price: '5.00',
              //                 onTap: () {},
              //               ),
              //               SizedBox(width: size.width * 0.03),
              //               ItemWidget(
              //                 productName: 'Coconut',
              //                 image: 'assets/items1.png',
              //                 itemcount: '1pc',
              //                 price: '5.00',
              //                 onTap: () {},
              //               ),
              //               SizedBox(width: size.width * 0.03),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
