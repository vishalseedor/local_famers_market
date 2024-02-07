import 'package:flutter/material.dart';
import 'package:local_farmers_project/screens/GlobalService/globalservice.dart';
import 'package:local_farmers_project/screens/ItemDetailsScreen/itemdetailsscreen.dart';
import 'package:local_farmers_project/screens/Widgets/demowidget.dart';


// ignore: must_be_immutable
class ItemWidget extends StatelessWidget {
  final String productName;
  final String image;
  final String itemcount;
  final String price;
  final Function() onTap;
  ItemWidget(
      {super.key,
      required this.productName,
      required this.image,
      required this.itemcount,
      required this.price,
      required this.onTap});

  final GlobalSnackBar snackbar = GlobalSnackBar();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
      
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
                productName,
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    onTap();
                  },
                  child: Image.asset(
                    image,
                    height: 120,
                    width: 120,
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
                        itemcount,
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        "₹ $price",
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
