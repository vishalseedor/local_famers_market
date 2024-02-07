import 'package:flutter/material.dart';
import 'package:local_farmers_project/screens/CartScreen/cartscreen.dart';
import 'package:local_farmers_project/screens/ItemDetailsScreen/itemdetailsscreen.dart';
import 'package:local_farmers_project/screens/Widgets/demowidget.dart';

import '../../Colors/colors.dart';


class AllProductWidget extends StatefulWidget {
  final String productid;
  final String productname;
  final String productprice;
  final String quantity;
  final String image;
  

  const AllProductWidget(
      {super.key,
     required this.productid,
     required this.productname,
     required this.productprice,
     required this.quantity,
     required this.image
      });

  @override
  State<AllProductWidget > createState() => _AllPetWidgetState();
}

class _AllPetWidgetState extends State<AllProductWidget > {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //  final pet = Provider.of<PetModel>(context);

     return InkWell(
      onTap: (){
       Navigator.of(context).pushNamed(ItemDetailScreen.routeName,arguments:widget.productid);
      // Navigator.push(context,MaterialPageRoute(builder: (context)=>CartScreen()));
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        // height: size.height * 0.25,
        // width: size.width * 0.38,
        // decoration: BoxDecoration(
        //     color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.productname,
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                   // onTap();
                  },
                  child: Image.network(
                    widget.image,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       'Quantity:${ widget.quantity}',
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        "₹ ${widget.productprice}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 13),
                      )
                    ],
                  ),
                  // SizedBox(
                  //   width: 40,
                  // ),
                  // Container(
                  //   height: 25,
                  //   width: 25,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(6),
                  //     color: greencolor,
                  //   ),
                  //   child: Icon(
                  //     Icons.add,
                  //     color: Colors.white,
                  //     size: 13,
                  //   ),
                  // )
               
                const DemoScreensss()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
