import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/CartScreen/mycartscreen.dart';
import 'package:local_farmers_project/screens/CategoryProvider/categoryprovider.dart';
import 'package:local_farmers_project/screens/ExtraScreens/loadingscreen.dart';
import 'package:local_farmers_project/screens/UserProvider/userprovider.dart';
import 'package:local_farmers_project/screens/ViewProducts%20Provider/allproductwidgetscreen.dart';
import 'package:local_farmers_project/screens/ViewProducts%20Provider/productprovider.dart';
import 'package:local_farmers_project/screens/Widgets/categorywidget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchText = TextEditingController();
bool isVisible=false;
  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false)
        .getAllProductData(context: context);
    Provider.of<UserProvider>(context,listen: false).getUsertData(context: context);
      Provider.of<CategoryProvider>(context, listen: false)
        .getAllCategoryData(context: context);
   

    super.initState();
  }
 
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final product = Provider.of<ProductProvider>(context);
    final category=Provider.of<CategoryProvider>(context);
    final userprovider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
   backgroundColor: backgroundcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 80,
       backgroundColor: backgroundcolor,
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
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
              Consumer<UserProvider>(builder: (context, value, child) {
                String userAddress = "";
                for (var i = 0; i < value.users.length; i++) {
                  userAddress = value.users[i].address;
                }
                return Text(
                  '$userAddress , India',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w900),
                );
              }),
            ],
          ),
          GestureDetector(
            onTap: () {
             Navigator.push(context,MaterialPageRoute(builder:(context)=> MyCartScreen()));
            },
            child: Image.asset(
              'assets/cart.png',
              height: 35,
              width: 35,
              
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
                      // width: 300,
                      // margin: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image(
                          image: AssetImage('assets/banner1.png'),
                        ),
                      ),
                    ),
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
                  ],
                  onPageChanged: (value) {},
                  autoPlayInterval: 3000,
                  isLoop: false,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.search,
                     // size: 17,
                    ),
                    hintText: "Search a Products",
                    hintStyle: TextStyle(
                        color: Colors.grey,
                       fontSize: 14,
                        fontWeight: FontWeight.w600),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) {
                    if (value != "") {
                      String searchQuery = value.toLowerCase();
                      print("hhhhhhhhh");
                      product.getSearchData(value: searchQuery);
                    }
                  },
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Row(
                        children: [
                //             category.loadingSpinner
                // ? const Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       LoadingScreen(title: 'Loading'),
                //       CircularProgressIndicator(
                //         color: Colors.blue,
                //       ),
                //       SizedBox(
                //         width: 10,
                //       ),
                //       Text(
                //         'Loading...',
                //         style: TextStyle(fontSize: 20),
                //       ),
                //     ],
                //   )
                // : category.categories.isEmpty
                //     ? const Center(child: Text('No Products...'))
                //     : ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: category.categories.length,
                //       itemBuilder: (context, index) {
                //         return AllCategoryWidget(
                //           id: category.categories[index].id,
                //           name:  category.categories[index].name,
                //           quantity: category.categories[index].quantity,
                //           farmerid:  category.categories[index].farmerid,
                //           image:  category.categories[index].image);
                      
                //     },),
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
                            style: TextStyle(color: greencolor),
                          ))
                        : product.searchProducts.isEmpty &&
                                searchController.text.isNotEmpty
                            ? Center(
                                child: Text(
                                'No Pets available...',
                                style: TextStyle(color: greencolor),
                              ))
                            : searchController.text.isNotEmpty &&
                                    product.searchProducts.isNotEmpty
                                ? SizedBox(
                                    height: size.height * 0.6,
                                    child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10,
                                              childAspectRatio: 0.86),
                                      scrollDirection: Axis.vertical,
                                      itemCount: product.searchProducts.length,
                                      itemBuilder: (context, intex) {
                                        return AllProductWidget(
                                          productid: product
                                              .searchProducts[intex].productId,
                                          productname: product
                                              .searchProducts[intex]
                                              .productName,
                                          productprice: product
                                              .searchProducts[intex].price,
                                          quantity: product
                                              .searchProducts[intex].quantity,
                                          image: product
                                              .searchProducts[intex].image,
                                        );
                                      },
                                    ),
                                  )
                                : SizedBox(
                                    height: size.height * 0.6,
                                    child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10,
                                              childAspectRatio: 0.86),
                                      scrollDirection: Axis.vertical,
                                      itemCount: product.products.length,
                                      itemBuilder: (context, intex) {
                                        return AllProductWidget(
                                          productid:
                                              product.products[intex].productId,
                                          productname: product
                                              .products[intex].productName,
                                          productprice:
                                              product.products[intex].price,
                                          quantity:
                                              product.products[intex].quantity,
                                          image: product.products[intex].image,
                                        );
                                      },
                                    ),
                                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
