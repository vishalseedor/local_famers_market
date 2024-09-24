import 'package:animate_do/animate_do.dart';
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
       backgroundColor: Colors.white,
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
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none
                    ),
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
                  FadeInUp(
                  duration:  const Duration(milliseconds: 1500),
                   child: category.loadingSpinner
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
                    : category.categories.isEmpty
                        ? Center(
                            child: Text(
                            'No Categories...',
                            style: TextStyle(color:greencolor),
                          ))
                        : SizedBox(
                            height: size.height * 0.07,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: category.categories.length,
                              itemBuilder: (context, intex) {
                                return CateoGoryWidget(
                                  id: category.categories[intex].id,
                                  title: category.categories[intex].name,
                                  image: category.categories[intex].image,
                                );
                              },
                            ),
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
                FadeInUp(
                  duration: const Duration(milliseconds: 1500),
                  child: product.loadingSpinner
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
                              'No Products...',
                              style: TextStyle(color: greencolor),
                            ))
                          : product.searchProducts.isEmpty &&
                                  searchController.text.isNotEmpty
                              ? Center(
                                  child: Text(
                                  'No Products available...',
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
                                                childAspectRatio: 0.78),
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
                                                childAspectRatio: 0.78),
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
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
