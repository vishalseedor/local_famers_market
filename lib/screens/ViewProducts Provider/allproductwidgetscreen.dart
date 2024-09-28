import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/CartProvider/cartprovider.dart';
import 'package:local_farmers_project/screens/CartScreen/globalservice.dart';
import 'package:local_farmers_project/screens/CartScreen/globalsnackbar.dart';
import 'package:local_farmers_project/screens/ItemDetailsScreen/itemdetailsscreen.dart';
import 'package:local_farmers_project/screens/UserProvider/userprovider.dart';
import 'package:local_farmers_project/screens/ViewProducts%20Provider/productprovider.dart';
import 'package:provider/provider.dart';

class AllProductWidget extends StatefulWidget {
  final String productid;
  final String productname;
  final String productprice;
  final String quantity;
  final String image;
  final String stock;

  const AllProductWidget(
      {super.key,
      required this.productid,
      required this.productname,
      required this.productprice,
      required this.quantity,
      required this.image,
      required this.stock
      });

  @override
  State<AllProductWidget> createState() => _AllProductWidgetState();
}

class _AllProductWidgetState extends State<AllProductWidget> {
  GlobalSnackBar _snackBar =GlobalSnackBar();
  ProductSnackBar _productSnackBar=ProductSnackBar();
  int _counter = 1;
  int totalCost = 0;
  bool _isLoading=false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productapi = Provider.of<ProductProvider>(context, listen: false);
    final cartapi = Provider.of<CartProvider>(context, listen: false);
    final userData = Provider.of<UserProvider>(context,   listen: false);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ItemDetailScreen.routeName, arguments: widget.productid);
        // Navigator.push(context,MaterialPageRoute(builder: (context)=>CartScreen()));
      },
      child: Card( 
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        // height: size.height * 0.25,
        // width: size.width * 0.38,
        // decoration: BoxDecoration(
        //     color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.productname,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // onTap();
                  },
                  child: Image.network(
                    widget.image,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Qty:${widget.quantity}',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        "₹ ${widget.productprice}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 13),
                      )
                    ],
                  ),
                  Container(
                    height: 40,
                    //width: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        // Container(
                        //   height: 35,
                        //   width: 35,
                        //   decoration: BoxDecoration(
                        //     border: Border.all(color: greencolor),
                        //     borderRadius: BorderRadius.circular(5),
                        //     shape: BoxShape.rectangle,
                        //   ),
                        //   child: InkWell(
                        //     onTap: () {
                        //       setState(() {
                        //         if (_counter != 0) {
                        //           return setState(() {
                        //             // _counter--;
                        //             // totalCost = int.parse(
                        //             //         widget.price.toString()) *
                        //             //     _counter;
                        //           });
                        //         } else {
                        //           return;
                        //         }
                        //       });
                        //     },
                        //     child: FittedBox(
                        //       child: Text(
                        //         '-',
                        //         style: TextStyle(
                        //             fontSize: 20,
                        //             fontWeight: FontWeight.bold,
                        //             color: greencolor),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   width: 25,
                        // ),
                        // Text(
                        //   '$_counter',
                        //   style: const TextStyle(
                        //     fontSize: 20,
                        //     fontFamily: 'Inter-Medium',
                        //   ),
                        // ),
                        // const SizedBox(
                        //   width: 25,
                        //),
                        Container(
                          height: 30,
                          width: 35,
                          decoration: BoxDecoration(
                            color: greencolor,
                            //shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5),
                          ),
      //                     child:  InkWell(
      //   onTap: _isLoading
      //       ? null // Disable onTap when loading
      //       : () async {
      //          bool isInCart = cartapi.carts.any(
      //                                   (item) =>
      //                                       item.productId == widget.productid);

      //                               if (isInCart) {
      //                                 ScaffoldMessenger.of(context).showSnackBar(
      //                                   _productSnackBar.productSnackbar(
      //                                       context: context),
      //                                 );
      //                               } else {
      //                                 try {
      //                                   // Add the item to the cart
      //                                   await cartapi.addItemToCart(
      //                                     productid: widget.productid,
      //                                     userid: userData.currentUserId,
      //                                     quanity: widget.quantity,
      //                                   );

      //                                   // Update products list
      //                                   await productapi
      //                                       .getAllProductData(
      //                                           context: context)
      //                                       .then((val) {
      //                                     setState(() {
      //                                       productapi.products
      //                                           .firstWhere((element) =>
      //                                               element.productId ==
      //                                               widget.productid);
      //                                     });
      //                                   });

      //                                   // Show success snackbar
      //                                   ScaffoldMessenger.of(context)
      //                                       .showSnackBar(
      //                                     _snackBar.customSnackbar(
      //                                         context: context),
      //                                   );
      //                                 } catch (e) {
      //                                   ScaffoldMessenger.of(context)
      //                                       .showSnackBar(
      //                                     SnackBar(
      //                                       content: Text(
      //                                         'Failed to add item to cart: $e',
      //                                       ),
      //                                     ),
      //                                   );
      //                                 }
      //                               }

      //                               setState(() {
      //                                 _isLoading = false;
      //                               });
      //     //       setState(() {
      //     //         _isLoading = true; // Set loading state to true when clicked
      //     //       });

      //     //       bool isInCart = cartapi.carts
      //     //           .any((item) => item.productId == widget.productid);

      //     //       if (isInCart) {
      //     //         // Show Snackbar if product is already in the cart
      //     //         ScaffoldMessenger.of(context).showSnackBar(
      //     //           _productSnackBar.productSnackbar(context: context),
      //     //         );
      //     //       } else {
      //     //         // Add the item to the cart through API
      //     //         cartapi.addItemToCart(
      //     //           productid: widget.productid.toString(),
      //     //           userid: userData.currentUserId.toString(),
      //     //           quanity: widget.quantity.toString(),
                    
      //     //         );
      //     //           await Provider.of<ProductProvider>(context, listen: false)
      //     //       .getAllProductData(context: context)
      //     //       .then((val) {
      //     //  productapi= Provider.of<ProductProvider>(context, listen: false)
      //     //         .products
      //     //         .firstWhere((element) => element.productId == widget.productid);
      //     //     print(widget.stock);
      //     //     setState(() {});
      //     //   });

      //     //         // Show success Snackbar after item is added
      //     //         ScaffoldMessenger.of(context).showSnackBar(
      //     //           _snackBar.customSnackbar(context: context),
      //     //         );
      //     //       }

      //     //       // Reset loading state after API call completes
      //     //       setState(() {
      //     //         _isLoading = false;
      //     //       });
      //         },
      //   child: Center(
      //     child: _isLoading
      //         ? CircularProgressIndicator(
      //             strokeWidth: 2.0,
      //             valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      //           ) // Show loading spinner while processing
      //         : Text(
      //             'Add',
      //             style: TextStyle(
      //               fontSize: 10,
      //               fontWeight: FontWeight.bold,
      //               color: Colors.white,
      //             ),
      //           ),
      //   ),
      // ),new code adeed
                          child: InkWell(
                            onTap: () async {
                              final provider =
                                  Provider.of<CartProvider>(context,listen: false);
                              bool isInCart = provider.carts.any(
                                  (item) => item.productId == widget.productid);
                              if (isInCart) {
                                
                                print(widget.productid);
                                 ScaffoldMessenger.of(context).showSnackBar(
                               _productSnackBar.productSnackbar(context: context)
                               
                              );
                              } else {
                                
                                cartapi.addItemToCart(
                productid: widget.productid.toString(),
                userid: userData.currentUserId.toString(),
                quanity: widget.quantity.toString());
                print(widget.productid);
            await Provider.of<ProductProvider>(context, listen: false)
                .getAllProductData(context: context)
                .then((val) {
              Provider.of<ProductProvider>(context, listen: false)
                  .products
                  .firstWhere((element) => element.productId == widget.productid);
              print(widget.stock);
              setState(() {});
            });


            ScaffoldMessenger.of(context)
                .showSnackBar(_snackBar.customSnackbar(context: context)
                   
                    );
           
                              //    cartapi.addItemToCart(
                              //     productid: widget.productid.toString(),
                              //     userid: userData.currentUserId.toString(),
                              //     quanity: widget.quantity.toString());
                               
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //  _snackBar.customSnackbar(context: context)
                              
                              // );
                            
                              }


                            },
                            child: Center(
                              child: Text(
                                'Add',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

//                 Container(
//           height: 30,
//           width: 30,
//           decoration: const BoxDecoration(
//             color: Colors.green,
//             borderRadius: BorderRadius.all(
//             Radius.circular(3)
//             ),
//           ),
//           child: InkWell(
//             onTap: ()async {
// //         final cartProvider = Provider.of<AddtoCartProvider>(context, listen: false);
// // final success = await cartProvider.addItemToCart(productid: ,quanity: ,userid:); // Assuming parameters are required for the addItemToCart method
// // if (success) {
// //   Navigator.push(context, MaterialPageRoute(builder:(context)=>const MyCartScreen()));
// //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //     content: Text('Item added to cart successfully'),

// //   ));
// // } else {
// //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //     content: Text('Failed to add item to cart'),
// //   ));
// // }
//             },

//             // onTap: _toggleVisibility,
//             child: const Icon(Icons.add, color: Colors.white, size: 13),
//           ),
//         ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
