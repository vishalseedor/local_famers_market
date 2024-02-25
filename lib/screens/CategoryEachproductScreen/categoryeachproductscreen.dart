import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/CategoryEachproductScreen/caregoryeachprovider.dart';
import 'package:local_farmers_project/screens/CategoryProvider/allcategorywidget.dart';
import 'package:local_farmers_project/screens/CategoryProvider/categoryprovider.dart';
import 'package:local_farmers_project/screens/ExtraScreens/loadingscreen.dart';

import 'package:provider/provider.dart';




class CategoryEachProductScreen extends StatefulWidget {
  const CategoryEachProductScreen({super.key});

  @override
  State<CategoryEachProductScreen> createState() => _CategoryEachProductScreenState();
}

class _CategoryEachProductScreenState extends State<CategoryEachProductScreen> {
    @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false)
        .getAllCategoryData(context: context);
  
    super.initState();
  }
   TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
     final category = Provider.of<CategoryProvider>(context);
     final searchcategory=Provider.of<CategoryEachProvider>(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 85,
          elevation: 0,
          backgroundColor: backgroundcolor,
          automaticallyImplyLeading: false,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
             
            ],
          ),
        ),
        backgroundColor: backgroundcolor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height*0.07,
                  child: TextFormField(
                    controller: searchController,
                   decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),fillColor: Colors.white,filled: true,suffixIcon: Icon(Icons.search,color: greencolor),hintText: 'Search'),
                   onChanged: (value) {
                       if (value != "") {
                          String searchQuery = value.toLowerCase();
                          print("hhhhhhhhh");
                          category.getSearchCategoryData(value: searchQuery);
                        }
                   },
                   
                  ),
                ),
                SizedBox(height: size.height*0.02,),
               category.loadingSpinner
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
                            'No Categoriess...',
                            style: TextStyle(color: greencolor),
                          ))
                        : category.searchCategoryProducts.isEmpty &&
                                searchController.text.isNotEmpty
                            ? Center(
                                child: Text(
                                'No Category available...',
                                style: TextStyle(color: greencolor),
                              ))
                            : searchController.text.isNotEmpty &&
                                    category.searchCategoryProducts.isNotEmpty
                                ? SizedBox(
                                    height: size.height * 0.6,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: category.searchCategoryProducts.length,
                                      itemBuilder: (context, intex) {
                                        return AllCategoryWidget(
                                          id:category.searchCategoryProducts[intex].id,
                                          name: category.searchCategoryProducts[intex].name,
                                          image: category.searchCategoryProducts[intex].image,
                                          farmerid: category.searchCategoryProducts[intex].farmerid,
                                           quantity: category.searchCategoryProducts[intex].quantity,
                                        );
                                      },
                                    ),
                                  )
                                : SizedBox(
                                    height: size.height * 0.6,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: category.categories.length,
                                      itemBuilder: (context, intex) {
                                        return AllCategoryWidget(
                                          id:category.categories[intex].id,
                                          name: category.categories[intex].name,
                                          image: category.categories[intex].image,
                                          farmerid: category.categories[intex].farmerid,
                                           quantity: category.categories[intex].quantity,
                                        );
                                      },
                                    ),
                                  ),
                
                SizedBox(
                  height: size.height * 0.012,
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
