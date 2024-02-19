import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/CartProvider/cartprovider.dart';
import 'package:local_farmers_project/screens/CategoryEachproductScreen/alleachcategory.dart';
import 'package:local_farmers_project/screens/CategoryEachproductScreen/caregoryeachprovider.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.grey[200],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'CategoryProducts',
                style: TextStyle(fontSize: 14),
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        body:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: cateproduct.loadingSpinner
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
                        ? Center(
                            child: Text(
                            'No Category Products...',
                            style: TextStyle(color:greencolor,fontWeight: FontWeight.bold),
                          ))
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
        ),     
      ),
    );
  }
}
