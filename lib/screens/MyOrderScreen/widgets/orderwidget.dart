import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/MyOrderScreen/myorderscreen.dart';

class Orderwidget extends StatefulWidget {
  final String orderid;
  final String productid;
  final String productname;
  final String productdescription;
  final String price;
  final String cartid;
  final String cartquantity;
  final String orderStatus;
  final String ordercreation;

  const Orderwidget({super.key,
  required this.orderid,
  required this.productid,
  required this.productname,
  required this.productdescription,
  required this.price,
  required this.cartid,
  required this.cartquantity,
  required this.orderStatus,
  required this.ordercreation
  });

  @override
  State<Orderwidget> createState() => _OrderwidgetState();
}

class _OrderwidgetState extends State<Orderwidget> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        
                    onTap: () {
                    },
                    child: SizedBox(
                      width: size.width,
                      child: Card(
                        elevation: 0,
                        // color: greencolor,
                        // height: size.height * 0.12,
                        // width: size.width * 0.9,
                        // decoration: BoxDecoration(
                        //     color: Colors.black,
                        //     borderRadius: BorderRadius.circular(4)),
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Row(
                                        children: [
                                          Text(
                                            'Order FM${widget.orderid}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                       Text(
                                        'DATE : ${widget.ordercreation.substring(0,16)}',
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 14,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                                SizedBox(
                                        height: size.height * 0.01,
                                      ),
                              Text('Product : ${widget.productname}',style: TextStyle(fontSize: 13),),
                              const DotDivider(),
                              Row(
                                children: [
                                 Text(
                                    'Quantity : ${widget.cartquantity}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  CircleAvatar(
                                    radius: 4,
                                    backgroundColor: greencolor,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                Text(
                                    '₹ : ${widget.price}',
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  ),
                                  const Spacer(),
                                  // SizedBox(
                                  //   width: size.width * 0.25,
                                  // ),
                                  Container(
                                    height: size.height * 0.04,
                                    width: size.width * 0.19,
                                    color: Colors.green[50],
                                    child: Center(
                                      child: Text(
                                        widget.orderStatus,
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: greencolor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
    );
  }
}