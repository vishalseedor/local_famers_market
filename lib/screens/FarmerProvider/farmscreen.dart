import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/ExtraScreens/loadingscreen.dart';
import 'package:local_farmers_project/screens/FarmerProvider/Allfarmerwidget.dart';
import 'package:local_farmers_project/screens/FarmerProvider/farmprovider.dart';
import 'package:provider/provider.dart';

class FamersScreen extends StatefulWidget {
  const FamersScreen({super.key});

  @override
  State<FamersScreen> createState() => _FamersScreenState();
}

class _FamersScreenState extends State<FamersScreen> {
   @override
  void initState() {
    Provider.of<FarmProvider>(context, listen: false)
        .getAllFarmersData(context: context);
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     final farmer = Provider.of<FarmProvider>(context);
     final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Farms',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
      ),
      body:FadeInUp(
        duration: const Duration(milliseconds: 3000),
        child: farmer.loadingSpinner
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
                    : farmer.farmers.isEmpty
                        ? Text('No Famers...')
                        : SizedBox(
                          height: size.height * 0.6,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: farmer.farmers.length,
                              itemBuilder: (context, intex) {
                                return AllFarmersWidget(
                                  id: farmer.farmers[intex].id,
                                  name: farmer.farmers[intex].name,
                                  farmname: farmer.farmers[intex].farmName,
                                  address: farmer.farmers[intex].address,
                                  image: farmer.farmers[intex].file,
                                  email: farmer.farmers[intex].email,
                                  farmstatus: farmer.farmers[intex].farmerStatus,
        
                             
                             
                                 
                                
                                );
                              },
                            ),
                          ),
      ),        
    );
  }
}