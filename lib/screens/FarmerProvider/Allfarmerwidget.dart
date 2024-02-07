import 'package:flutter/material.dart';
import 'package:local_farmers_project/screens/CartScreen/cartscreen.dart';
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

     return ListTile(
      leading:CircleAvatar(
        radius: 60,
        backgroundImage: NetworkImage(widget.image),
        
      ),
      title: Text(widget.name),
      subtitle: Text(widget.farmname),
     );
  }
}
