import 'package:flutter/material.dart';
import 'package:local_farmers_project/screens/CartScreen/cartscreen.dart';
import 'package:local_farmers_project/screens/FarmerProvider/farmdetailsscreen.dart';
import 'package:local_farmers_project/screens/ItemDetailsScreen/itemdetailsscreen.dart';
import 'package:local_farmers_project/screens/Widgets/demowidget.dart';

import '../../Colors/colors.dart';


class AllFarmersWidget extends StatefulWidget {
  final String id;
  final String name;
  final String image;
  final String farmname;
  final String address;
  

  const AllFarmersWidget(
      {super.key,
     required this.id,
     required this.name,
     required this.image,
     required this.farmname,
     required this.address
      });

  @override
  State<AllFarmersWidget > createState() => _AllPetWidgetState();
}

class _AllPetWidgetState extends State<AllFarmersWidget > {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //  final pet = Provider.of<PetModel>(context);

     return       Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                            child: InkWell(
                              onTap: (){
                                 Navigator.of(context).pushNamed(FarmerDetailsScreen.routeName,arguments:widget.id);
                              },
                              child: Card(
                                color: Colors.green[100],
                                child: ListTile(
                                  leading: Container(
                                    child: Image.network(widget.image, fit: BoxFit.cover),
                                         ),
                                           title: Text(widget.farmname),
                                             subtitle: Text(widget.address),
                                                trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.lightBlueAccent,
                                ),
                                       ),
                                
                                
                               
                                ),
                            ),
                            );
                        
  }
}
