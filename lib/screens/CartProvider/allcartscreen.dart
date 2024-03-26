import 'package:flutter/material.dart';
import 'package:local_farmers_project/screens/CartProvider/cartprovider.dart';
import 'package:local_farmers_project/screens/ExtraScreens/errorscreen.dart';
import 'package:local_farmers_project/screens/ExtraScreens/loadingscreen.dart';

import 'package:provider/provider.dart';


class AllCartScreen extends StatefulWidget {
  static const routeName = 'all_cart_screen';

  const AllCartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AllCartScreen> createState() => _AllCartScreenState();
}

class _AllCartScreenState extends State<AllCartScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context, listen: false)
        .getAllCartsData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final cart= Provider.of<CartProvider>(context);
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
        body: cart.islOading
            ? const LoadingScreen(
                title: 'Loading...',
              )
            : cart.isError
                ? ErrorScreen(title:cart.isError.toString())
                : cart.carts.isEmpty
                    ? const Text(
                        'No Carts ',
                      )
                    :cart.carts.isEmpty
                        ? const Center(child: Text("No Carts"))
                        : ListView.builder(
                            itemCount: cart.carts.length,
                            itemBuilder: (ctx, index) {
                              print(cart.carts.length.toString());
                              // return ChangeNotifierProvider.value(
                              //     value: pet.pets[index],
                              //     child: const AllPetWidget());
                            }),
      ),
    );
  }
}
