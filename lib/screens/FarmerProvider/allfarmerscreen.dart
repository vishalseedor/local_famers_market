import 'package:flutter/material.dart';
import 'package:local_farmers_project/screens/ExtraScreens/errorscreen.dart';
import 'package:local_farmers_project/screens/ExtraScreens/loadingscreen.dart';
import 'package:local_farmers_project/screens/FarmerProvider/farmprovider.dart';
import 'package:local_farmers_project/screens/ViewProducts%20Provider/productprovider.dart';

import 'package:provider/provider.dart';


class AllFarmersScreen extends StatefulWidget {
  static const routeName = 'all_farmer_screen';

  const AllFarmersScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AllFarmersScreen> createState() => _AllFarmersScreenState();
}

class _AllFarmersScreenState extends State<AllFarmersScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<FarmProvider>(context, listen: false)
        .getAllFarmersData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final farmer= Provider.of<FarmProvider>(context);
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
        body: farmer.islOading
            ? const LoadingScreen(
                title: 'Loading...',
              )
            : farmer.isError
                ? ErrorScreen(title: farmer.isError.toString())
                : farmer.farmers.isEmpty
                    ? const Text(
                        'No Farmers ',
                      )
                    : farmer.farmers.isEmpty
                        ? const Center(child: Text("No Farmers"))
                        : ListView.builder(
                            itemCount: farmer.farmers.length,
                            itemBuilder: (ctx, index) {
                              print(farmer.farmers.length.toString());
                              // return ChangeNotifierProvider.value(
                              //     value: pet.pets[index],
                              //     child: const AllPetWidget());
                            }),
      ),
    );
  }
}
