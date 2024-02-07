import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/ExtraScreens/loadingscreen.dart';
import 'package:local_farmers_project/screens/ViewProducts%20Provider/allproductwidgetscreen.dart';
import 'package:local_farmers_project/screens/ViewProducts%20Provider/productprovider.dart';
import 'package:local_farmers_project/screens/Widgets/categorywidget.dart';
import 'package:local_farmers_project/screens/Widgets/itemwidget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchText = TextEditingController();

  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false)
        .getAllProductData(context: context);
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
     final product = Provider.of<ProductProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: Colors.grey[200],
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  const Text(
                    'Local Farmers Market',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context, 
                        //     MaterialPageRoute(
                        //         builder: (context) => const AddressScreen()));
                      },
                      child: const Icon(
                        Icons.expand_more,
                        size: 20,
                      ))
                ],
              ),
              const Text(
                'Trivandrum,India',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const WalletHomeScreen()));
            },
            child: Image.asset(
              'assets/ic_wallet.png',
              scale: 3,
            ),
          )
        ]),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        // final Size size = constraints.biggest;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                ImageSlideshow(

                  //  indicatorRadius: ,
                  width: double.infinity,
                  height: size.height * 0.26,
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,
                  children: [
                    Container(
                    //  width: 500,
                      // margin: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image(
                          image: AssetImage('assets/banner2.png'),
                        ),
                      ),
                    ),
                    Container(
                    //  width: 300,
                      //  margin: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image(
                          image: AssetImage('assets/banner3.png'),
                        ),
                      ),
                    ),
                    Container(
                     // width: 300,
                      // margin: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image(
                          image: AssetImage('assets/banner1.png'),
                        ),
                      ),
                    ),
                    // Image.asset(

                    //   'assets/banner2.png',
                    //   fit: BoxFit.cover,
                    // ),
                    // Image.asset(
                    //   'assets/banner3.png',
                    //   fit: BoxFit.cover,
                    // ),
                    // Image.asset(
                    //   'assets/banner1.png',
                    //   fit: BoxFit.cover,
                    // )
                  ],
                  onPageChanged: (value) {},
                  autoPlayInterval: 3000,
                  isLoop: false,
                 ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Container(
                    // elevation: 0,
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(5)),
                    height: size.height * 0.06,
                    width: size.width * 0.90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // color: affnityBottomAppBarBackgroundColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            size: 17,
                          ),
                          hintText: "Search a Grocery",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Categories',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                //category.loadingSpinner
                // ? const Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       LoadingScreen(title: 'Loading'),
                //       // CircularProgressIndicator(
                //       //   color: Colors.blue,
                //       // ),
                //       SizedBox(
                //         width: 10,
                //       ),
                //       // Text(
                //       //   'Loading...',
                //       //   style: TextStyle(fontSize: 20),
                //       // ),
                //     ],
                //   )
                // : category.categories.isEmpty
                //     ? const Center(child: Text('No Products...'))
                //     : const CategoryProductWid(),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CateoGoryWidget(
                              image: 'assets/cate.png',
                              title: 'Fruits &',
                              subtitle: 'Vegtables',
                              ontap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const CategoryDashBoardScreen()));
                              }),
                          // const SizedBox(
                          //   width: 5,
                          // ),
                          CateoGoryWidget(
                              image: 'assets/categories3.png',
                              title: 'Nut &',
                              subtitle: 'Dry Fruits',
                              ontap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const CategoryDashBoardScreen()));
                              }),
                          // const SizedBox(
                          //   width: 5,
                          // ),
                          CateoGoryWidget(
                              image: 'assets/categories5.png',
                              title: 'Ice Creams',
                              subtitle: 'Desserts',
                              ontap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const CategoryDashBoardScreen()));
                              }),
                          // const SizedBox(
                          //   width: 5,
                          // ),
                          CateoGoryWidget(
                              image: 'assets/cate.png',
                              title: 'Fruits &',
                              subtitle: 'Vegtables',
                              ontap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const CategoryDashBoardScreen()));
                              }),
                          // const SizedBox(
                          //   width: 5,
                          // ),
                          CateoGoryWidget(
                              image: 'assets/cate.png',
                              title: 'Fruits &',
                              subtitle: 'Vegtables',
                              ontap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const CategoryDashBoardScreen()));
                              }),
                          // const SizedBox(
                          //   width: 5,
                          // ),
                          CateoGoryWidget(
                              image: 'assets/cate.png',
                              title: 'Fruits &',
                              subtitle: 'Vegtables',
                              ontap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const CategoryDashBoardScreen()));
                              }),
                          // const SizedBox(
                          //   width: 5,
                          // ),
                          CateoGoryWidget(
                              image: 'assets/cate.png',
                              title: 'Fruits &',
                              subtitle: 'Vegtables',
                              ontap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const CategoryDashBoardScreen()));
                              }),
                          // const SizedBox(
                          //   width: 5,
                          // ),
                          CateoGoryWidget(
                              image: 'assets/cate.png',
                              title: 'Fruits &',
                              subtitle: 'Vegtables',
                              ontap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const CategoryDashBoardScreen()));
                              }),
                        ],
                      ),
                      // const SizedBox(
                      //   height: 6,
                      // ),
                      Row(
                        children: [
                          CateoGoryWidget(
                              image: 'assets/categories2.png',
                              title: 'Cooking',
                              subtitle: 'Essentials',
                              ontap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const CategoryDashBoardScreen()));
                              }),
                          // const SizedBox(
                          //   width: 5,
                          // ),
                          CateoGoryWidget(
                              image: 'assets/categories4.png',
                              title: 'Drink',
                              subtitle: 'Beverage',
                              ontap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const CategoryDashBoardScreen()));
                              }),
                          // const SizedBox(
                          //   width: 5,
                          // ),
                          CateoGoryWidget(
                              image: 'assets/cate.png',
                              title: 'Fruits &',
                              subtitle: 'Vegtabless',
                              ontap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const CategoryDashBoardScreen()));
                              }),
                          // const SizedBox(
                          //   width: 5,
                          // ),
                          CateoGoryWidget(
                              image: 'assets/cate.png',
                              title: 'Fruits &',
                              subtitle: 'Vegtables',
                              ontap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const CategoryDashBoardScreen()));
                              }),
                          // const SizedBox(
                          //   width: 5,
                          // ),
                          CateoGoryWidget(
                              image: 'assets/cate.png',
                              title: 'Fruits &',
                              subtitle: 'Vegtables',
                              ontap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const CategoryDashBoardScreen()));
                              }),
                          // const SizedBox(
                          //   width: 5,
                          // ),
                          CateoGoryWidget(
                              image: 'assets/cate.png',
                              title: 'Fruits &',
                              subtitle: 'Vegtables',
                              ontap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const CategoryDashBoardScreen()));
                              }),
                          // const SizedBox(
                          //   width: 5,
                          // ),
                          CateoGoryWidget(
                              image: 'assets/cate.png',
                              title: 'Fruits &',
                              subtitle: 'Vegtables',
                              ontap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const CategoryDashBoardScreen()));
                              }),
                          // const SizedBox(
                          //   width: 5,
                          // ),
                          CateoGoryWidget(
                              image: 'assets/cate.png',
                              title: 'Fruits &',
                              subtitle: 'Vegtables',
                              ontap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const CategoryDashBoardScreen()));
                              }),
                        ],
                      ),
                    ],
                  ),
                ),

                // SizedBox(
                //   width: double.infinity,
                //   height: size.height * 0.078,
                //   child: GridView(
                //     scrollDirection: Axis.horizontal,
                //     gridDelegate:
                //         const SliverGridDelegateWithMaxCrossAxisExtent(
                //             maxCrossAxisExtent: 250,
                //             childAspectRatio: 1 / 2,
                //             crossAxisSpacing: 15,
                //             mainAxisSpacing: 15),
                //     children: [
                //       CateoGoryWidget(
                //           image: 'assets/categories4.png',
                //           title: 'Drink&',
                //           subtitle: 'Beverages',
                //           ontap: () {
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) =>
                //                         const CategoryDashBoardScreen()));
                //           }),
                //       CateoGoryWidget(
                //           image: 'assets/cate.png',
                //           title: 'Fruits &',
                //           subtitle: 'Vegtables',
                //           ontap: () {
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) =>
                //                         const CategoryDashBoardScreen()));
                //           }),
                //       CateoGoryWidget(
                //           image: 'assets/categories2.png',
                //           title: 'Cooking',
                //           subtitle: 'Essentials',
                //           ontap: () {
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) =>
                //                         const CategoryDashBoardScreen()));
                //           }),
                //       CateoGoryWidget(
                //           image: 'assets/cate.png',
                //           title: 'Fruits &',
                //           subtitle: 'Vegtables',
                //           ontap: () {
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) =>
                //                         const CategoryDashBoardScreen()));
                //           }),
                //       CateoGoryWidget(
                //           image: 'assets/cate.png',
                //           title: 'Fruits &',
                //           subtitle: 'Vegtables',
                //           ontap: () {
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) =>
                //                         const CategoryDashBoardScreen()));
                //           }),
                //       CateoGoryWidget(
                //           image: 'assets/cate.png',
                //           title: 'Fruits &',
                //           subtitle: 'Vegtables',
                //           ontap: () {
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) =>
                //                         const CategoryDashBoardScreen()));
                //           }),
                //       CateoGoryWidget(
                //           image: 'assets/cate.png',
                //           title: 'Fruits &',
                //           subtitle: 'Vegtables',
                //           ontap: () {
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) =>
                //                         const CategoryDashBoardScreen()));
                //           }),
                //       CateoGoryWidget(
                //           image: 'assets/cate.png',
                //           title: 'Fruits &',
                //           subtitle: 'Vegtables',
                //           ontap: () {
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) =>
                //                         const CategoryDashBoardScreen()));
                //           }),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Popular Near You',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                // product.loadingSpinner
                //     ? const Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           LoadingScreen(title: 'Loading'),
                //           // CircularProgressIndicator(
                //           //   color: Colors.blue,
                //           // ),
                //           SizedBox(
                //             width: 10,
                //           ),
                //           // Text(
                //           //   'Loading...',
                //           //   style: TextStyle(fontSize: 20),
                //           // ),
                //],
                //  )
                // : product.products.isEmpty
                //     ? const Center(child: Text('No Products...'))
                //     : const PopularProductWid(),
                SizedBox(
                  height: size.height * 0.01,
                ),
                 product.loadingSpinner
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
                  : product.products.isEmpty
                      ? Center(
                          child: Text(
                          'No Pets...',
                          style: TextStyle(color:greencolor),
                        ))
                      : SizedBox(
                          height: size.height * 0.6,
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10,childAspectRatio: 0.9),
                            scrollDirection: Axis.vertical,
                            itemCount: product.products.length,
                            itemBuilder: (context, intex) {
                              return AllProductWidget(
                                productid: product.products[intex].productId,
                                productname: product.products[intex].productName,
                                productprice: product.products[intex].price,
                                quantity: product.products[intex].quantity,
                                image: product.products[intex].image,
                              
                              );
                            },
                          ),
                        ),        
                // Column(
                //   children: [
                //     Row(
                //       children: [
                //         Expanded(
                //           child: ItemWidget(
                //               productName: 'Watermelon',
                //               image: 'assets/items8.png',
                //               itemcount: '1 pc',
                //               price: '5.00',
                //               onTap: () {
                //                 // Navigator.push(
                //                 //     context,
                //                 //     MaterialPageRoute(
                //                 //         builder: (context) =>
                //                 //             const ItemDetailScreen()));
                //               }),
                //         ),
                //         const SizedBox(width: 3),
                //         Expanded(
                //           child: ItemWidget(
                //               productName: 'Mango',
                //               image: 'assets/items5.png',
                //               itemcount: '500 gm',
                //               price: '5.00',
                //               onTap: () {
                //                 // Navigator.push(
                //                 //     context,
                //                 //     MaterialPageRoute(
                //                 //         builder: (context) =>
                //                 //             const ItemDetailScreen()));
                //               }),
                //         )
                //       ],
                //     ),
                //     SizedBox(
                //       height: size.height * 0.004,
                //     ),
                //     Row(
                //       children: [
                //         Expanded(
                //           child: ItemWidget(
                //               productName: 'Tender Coconut',
                //               image: 'assets/items7.png',
                //               itemcount: '1 pc',
                //               price: '6.00',
                //               onTap: () {
                //                 // Navigator.push(
                //                 //     context,
                //                 //     MaterialPageRoute(
                //                 //         builder: (context) =>
                //                 //             const ItemDetailScreen()));
                //               }),
                //         ),
                //         const SizedBox(
                //           width: 3,
                //         ),
                //         //  Spacer(),
                //         Expanded(
                //           child: ItemWidget(
                //               productName: 'Muskmelon',
                //               image: 'assets/items6.png',
                //               itemcount: '1 pc',
                //               price: '4.50',
                //               onTap: () {
                //                 // Navigator.push(
                //                 //     context,
                //                 //     MaterialPageRoute(
                //                 //         builder: (context) =>
                //                 //             const ItemDetailScreen()));
                //               }),
                //         )
                //       ],
                //     ),
                //     SizedBox(
                //       height: size.height * 0.004,
                //     ),
                //     Row(
                //       children: [
                //         Expanded(
                //           child: ItemWidget(
                //               productName: 'Fresh Kiwi',
                //               image: 'assets/items3.png',
                //               itemcount: '400 gm',
                //               price: '5.70',
                //               onTap: () {
                //                 // Navigator.push(
                //                 //     context,
                //                 //     MaterialPageRoute(
                //                 //         builder: (context) =>
                //                 //             const ItemDetailScreen()));
                //               }),
                //         ),
                //         const SizedBox(
                //           width: 3,
                //         ),
                //         //Spacer(),
                //         Expanded(
                //           child: ItemWidget(
                //               productName: 'Jackfruit',
                //               image: 'assets/items2.png',
                //               itemcount: '1 kg',
                //               price: '2.50',
                //               onTap: () {
                //                 // Navigator.push(
                //                 //     context,
                //                 //     MaterialPageRoute(
                //                 //         builder: (context) =>
                //                 //             const ItemDetailScreen()));
                //               }),
                //         )
                //       ],
                //     ),
                //     SizedBox(
                //       height: size.height * 0.004,
                //     ),
                //     Row(
                //       children: [
                //         Expanded(
                //           child: ItemWidget(
                //               productName: 'Green Mango',
                //               image: 'assets/items4.png',
                //               itemcount: '1 pc',
                //               price: '6.00',
                //               onTap: () {
                //                 // Navigator.push(
                //                 //     context,
                //                 //     MaterialPageRoute(
                //                 //         builder: (context) =>
                //                 //             const ItemDetailScreen()));
                //               }),
                //         ),
                //         const SizedBox(
                //           width: 3,
                //         ),
                //         // Spacer(),
                //         Expanded(
                //           child: ItemWidget(
                //               productName: 'Coconut',
                //               image: 'assets/items1.png',
                //               itemcount: '1pc',
                //               price: '5.00',
                //               onTap: () {
                //                 // Navigator.push(
                //                 //     context,
                //                 //     MaterialPageRoute(
                //                 //         builder: (context) =>
                //                 //             const ItemDetailScreen()));
                //               }),
                //         )
                //       ],
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        );
      }),
    );
  }
}
