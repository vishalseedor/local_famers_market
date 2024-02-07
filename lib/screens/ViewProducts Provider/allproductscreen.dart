import 'package:flutter/material.dart';
import 'package:local_farmers_project/screens/ExtraScreens/errorscreen.dart';
import 'package:local_farmers_project/screens/ExtraScreens/loadingscreen.dart';
import 'package:local_farmers_project/screens/ViewProducts%20Provider/productprovider.dart';

import 'package:provider/provider.dart';


class AllProductScreen extends StatefulWidget {
  static const routeName = 'all_product_screen';

  const AllProductScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  @override
  void initState() {
    super.initState();
    // Provider.of<PetProvider>(context, listen: false)
    //     .get(context: context, categoryproduct: widget.cateproduct);
    Provider.of<ProductProvider>(context, listen: false)
        .getAllProductData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final product= Provider.of<ProductProvider>(context);
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
                'Products',
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
        body: product.islOading
            ? const LoadingScreen(
                title: 'Loading...',
              )
            : product.isError
                ? ErrorScreen(title: product.isError.toString())
                : product.products.isEmpty
                    ? const Text(
                        'No Products ',
                      )
                    : product.products.isEmpty
                        ? const Center(child: Text("No Products"))
                        : ListView.builder(
                            itemCount: product.products.length,
                            itemBuilder: (ctx, index) {
                              print(product.products.length.toString());
                              // return ChangeNotifierProvider.value(
                              //     value: pet.pets[index],
                              //     child: const AllPetWidget());
                            }),
      ),
    );
  }
}
