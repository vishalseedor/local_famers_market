import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/ItemDetailsScreen/itemdetailsscreen.dart';



class AllEachCategoryWidget extends StatefulWidget {
  final String productid;
  final String productname;
  final String productprice;
  final String quantity;
  final String image;
  

  const AllEachCategoryWidget(
      {super.key,
     required this.productid,
     required this.productname,
     required this.productprice,
     required this.quantity,
     required this.image
      });

  @override
  State<AllEachCategoryWidget > createState() => _AllEachCategoryWidgetState();
}

class _AllEachCategoryWidgetState extends State<AllEachCategoryWidget > {
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
                  Container(
                    height: 30,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: greencolor,
                    ),
                    child: Center(child: Text('Add',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),))
                  )
               
               // const DemoScreensss()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
