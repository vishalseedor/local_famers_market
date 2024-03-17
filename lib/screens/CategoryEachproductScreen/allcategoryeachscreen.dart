import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/CategoryEachproductScreen/alleachcategory.dart';
import 'package:local_farmers_project/screens/CategoryEachproductScreen/caregoryeachprovider.dart';
import 'package:local_farmers_project/screens/CategoryProvider/emptycategoryscreen.dart';
import 'package:local_farmers_project/screens/ExtraScreens/loadingscreen.dart';

import 'package:provider/provider.dart';


class AllCategoryEachScreen extends StatefulWidget {
  static const routeName = 'all_categoryproduct_screen';
    final String cateproduct;

  const AllCategoryEachScreen({
    Key? key,required this.cateproduct
  }) : super(key: key);

  @override
  State<AllCategoryEachScreen> createState() => _AllCategoryEachScreenState();
}

class _AllCategoryEachScreenState extends State<AllCategoryEachScreen> {
  TextEditingController searchController=TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<CategoryEachProvider>(context, listen: false)
        .getAllEachCategorysData(context: context,categoryproduct: widget.cateproduct);
        
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cateproduct= Provider.of<CategoryEachProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor:greencolor,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'CategoryProducts',
              style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold),
            ),
         
          ],
        ),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Category Products Near You',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            //  cateproduct.category.isEmpty?Text(''): TextFormField(
            //     decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),fillColor: Colors.white,filled: true,hintText: 'Search',suffixIcon: Icon(Icons.search)),
            //       onChanged: (value) {
            //       if (value != "") {
            //         String searchQuery = value.toLowerCase();
            //         print("hhhhhhhhh");
            //         cateproduct.getSearchData(value: searchQuery);
            //       }
            //     },
            //   ),
              SizedBox(height: size.height*0.02),
              cateproduct.loadingSpinner
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
                           : cateproduct.category.isEmpty
                      ? const EmptyCategoryScreen()
                      : cateproduct.searchProducts.isEmpty &&
                              searchController.text.isNotEmpty
                          ? Center(
                              child: Text(
                              'No Pets available...',
                              style: TextStyle(color: greencolor),
                            ))
                          : searchController.text.isNotEmpty &&
                                  cateproduct.searchProducts.isNotEmpty
                              ? SizedBox(
                                  height: size.height * 0.6,
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10,
                                            childAspectRatio: 0.9),
                                    scrollDirection: Axis.vertical,
                                    itemCount: cateproduct.searchProducts.length,
                                    itemBuilder: (context, intex) {
                                      return AllEachCategoryWidget(
                                      productid: cateproduct.searchProducts[intex].productId,
                                      productname:cateproduct.searchProducts[intex].productName,
                                      productprice: cateproduct.searchProducts[intex].price,
                                      quantity:cateproduct.searchProducts[intex].quantity,
                                      image: cateproduct.searchProducts[intex].image,
                                    
                                    );
                                    },
                                  ),
                                )
                          
                        : cateproduct.category.isEmpty
                            ? const EmptyCategoryScreen()
                            : SizedBox(
                                height: size.height * 0.6,
                                child: GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10,childAspectRatio: 0.9),
                                  scrollDirection: Axis.vertical,
                                  itemCount: cateproduct.category.length,
                                  itemBuilder: (context, intex) {
                                    return AllEachCategoryWidget(
                                      productid: cateproduct.category[intex].productId,
                                      productname:cateproduct.category[intex].productName,
                                      productprice: cateproduct.category[intex].price,
                                      quantity:cateproduct.category[intex].quantity,
                                      image: cateproduct.category[intex].image,
                                    
                                    );
                                  },
                                ),
                              ),
            ],
          ),
        ),
      ),     
    );
  }
}
