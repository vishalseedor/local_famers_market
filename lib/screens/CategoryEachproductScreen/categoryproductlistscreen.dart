import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/CategoryEachproductScreen/alleachcategory.dart';
import 'package:local_farmers_project/screens/CategoryEachproductScreen/caregoryeachprovider.dart';
import 'package:local_farmers_project/screens/ExtraScreens/loadingscreen.dart';
import 'package:local_farmers_project/screens/ViewProducts%20Provider/productprovider.dart';
import 'package:provider/provider.dart';

class CategoryProductScreen extends StatefulWidget {
  final String cate;
  const CategoryProductScreen({super.key,required this.cate});

  @override
  State<CategoryProductScreen> createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> {
   @override
  void initState() {
    Provider.of<CategoryEachProvider>(context, listen: false)
        .getAllEachCategorysData(context: context,categoryproduct: widget.cate);
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     final cateproduct = Provider.of<CategoryEachProvider>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        title: Text('Category Lists'),
      ),
      body:cateproduct.loadingSpinner
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
                          'No Pets...',
                          style: TextStyle(color:greencolor),
                        ))
                      : SizedBox(
                          height: size.height * 0.6,
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),
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
    );
  }
}