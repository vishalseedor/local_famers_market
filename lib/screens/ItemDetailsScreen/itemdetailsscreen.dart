import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/CartProvider/cartprovider.dart';
import 'package:local_farmers_project/screens/CartScreen/globalservice.dart';
import 'package:local_farmers_project/screens/CartScreen/globalsnackbar.dart';
import 'package:local_farmers_project/screens/CartScreen/mycartscreen.dart';
import 'package:local_farmers_project/screens/UserProvider/userprovider.dart';
import 'package:local_farmers_project/screens/ViewProducts%20Provider/productprovider.dart';
import 'package:provider/provider.dart';

class ItemDetailScreen extends StatefulWidget {
  static const routeName = 'product_details_screen';
  final String id;
  const ItemDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  void initState() {
    Provider.of<CartProvider>(context, listen: false)
        .getAllCartsData(context: context);
    Provider.of<ProductProvider>(context, listen: false)
        .getAllProductData(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalSnackBar _snackBar = GlobalSnackBar();
    ProductSnackBar _productSnackBar = ProductSnackBar();
    final size = MediaQuery.of(context).size;
    final product = Provider.of<ProductProvider>(context, listen: false);
    final cartapi = Provider.of<CartProvider>(context);
    final userData = Provider.of<UserProvider>(context, listen: false);
    var productData = Provider.of<ProductProvider>(context)
        .products
        .firstWhere((element) => element.productId == widget.id);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: greencolor,
        elevation: 0,
        title: const Text(
          'Products Details',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyCartScreen()));
              },
              child: Image.asset(
                'assets/cart.png',
                height: 35,
                width: 35,
              ),
            ),
          )
        ],
      ),
      body: FadeInUp(
        duration: const Duration(milliseconds: 3000),
        child: SingleChildScrollView(
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
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  'Quantity : ${productData.quantity}',
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  'Category : ${productData.category}',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: Colors.brown),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  'Available Stocks : ${productData.stock}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹ ${productData.price}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),
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
                //         InkWell(
                //           onTap: ()async {
                //                       cartapi.addItemToCart(productid: productData.productId.toString(),userid:user.currentUserId.toString(),quanity:productData.quantity.toString());
                //                           ScaffoldMessenger.of(context).showSnackBar(
                //    SnackBar(
                //     backgroundColor: greencolor,
                //     content: const Text('Item added to cart successfully!',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                //     duration: const Duration(seconds: 1),
                //   ),
                // );
                //                        await Navigator.push(context,MaterialPageRoute(builder: (context)=> MyCartScreen()));

                //           },
                //           child: Container(
                //             height: 60,

                //             width: double.infinity,
                //             decoration: BoxDecoration(color: greencolor,borderRadius: BorderRadius.circular(10)),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Icon(IconlyBold.bag,color: Colors.white),
                //                 SizedBox(width: size.width*0.02,),
                //                 Text('Add to Cart',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)
                //               ],
                //             ),
                //           ),
                //         ),
                //    FadeInUp(
                //   duration: const Duration(milliseconds: 3000),
                //   child: product.loadingSpinner
                //       ? Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             const LoadingScreen(title: 'Loading'),
                //             CircularProgressIndicator(
                //               color: greencolor,
                //             ),
                //             const SizedBox(
                //               width: 10,
                //             ),
                //           ],
                //         )
                //       : product.products.isEmpty
                //           ? Center(
                //               child: Text(
                //               'No Pets...',
                //               style: TextStyle(color: greencolor),
                //             ))

                //                   : SizedBox(
                //                       height: size.height * 0.26,

                //                       child: ListView.builder(

                //                         scrollDirection: Axis.horizontal,
                //                         itemCount: product.products.length,
                //                         itemBuilder: (context, intex) {
                //                           return AllProductWidget(
                //                             productid:
                //                                 product.products[intex].productId,
                //                             productname: product
                //                                 .products[intex].productName,
                //                             productprice:
                //                                 product.products[intex].price,
                //                             quantity:
                //                                 product.products[intex].quantity,
                //                             image: product.products[intex].image,
                //                           );
                //                         },
                //                       ),
                //                     ),
                // ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          final provider = Provider.of<CartProvider>(context, listen: false);
          bool isInCart = provider.carts
              .any((item) => item.productId == productData.productId);
          if (isInCart) {
            ScaffoldMessenger.of(context)
                .showSnackBar(_productSnackBar.productSnackbar(context: context)
                    // SnackBar(
                    //   backgroundColor: greencolor,
                    //   content: const Text(
                    //     'Item added to cart successfully!',
                    //     style: TextStyle(
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    //   duration: const Duration(seconds: 4),
                    // ),
                    );
            //    ScaffoldMessenger.of(context).showSnackBar(
            //   // SnackBar(
            //   //   backgroundColor: greencolor,
            //   //   content: const Text(
            //   //     'Product Already in cart',
            //   //     style: TextStyle(
            //   //         color: Colors.white,
            //   //         fontWeight: FontWeight.bold),
            //   //   ),
            //   //   duration: const Duration(seconds: 1),
            //   // ),
            // );
          } else {
            cartapi.addItemToCart(
                productid: productData.productId.toString(),
                userid: userData.currentUserId.toString(),
                quanity: productData.quantity.toString());
            await Provider.of<ProductProvider>(context, listen: false)
                .getAllProductData(context: context)
                .then((val) {
              productData = Provider.of<ProductProvider>(context, listen: false)
                  .products
                  .firstWhere((element) => element.productId == widget.id);
              print(productData.stock);
              setState(() {});
            });


            ScaffoldMessenger.of(context)
                .showSnackBar(_snackBar.customSnackbar(context: context)
                    // SnackBar(
                    //   backgroundColor: greencolor,
                    //   content: const Text(
                    //     'Item added to cart successfully!',
                    //     style: TextStyle(
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    //   duration: const Duration(seconds: 4),
                    // ),
                    );
            //  await Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => MyCartScreen()));
          }
        },
        child: Container(
          height: 65,
          decoration: BoxDecoration(
              color: greencolor, borderRadius: BorderRadius.circular(0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                IconlyBold.bag,
                color: Colors.white,
              ),
              SizedBox(width: size.width * 0.02),
              Text(
                'Add to Cart',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      // floatingActionButton: SizedBox(
      //   height: 60,
      //   width: double.infinity,
      //   child: FloatingActionButton(
      //     backgroundColor: greencolor,
      //     onPressed: (){

      //     },

      //     ),
      // ),
    );
  }
}
