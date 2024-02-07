import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';



class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundcolor,
        appBar: AppBar(
          toolbarHeight: 80,
          title: const Text(
            'My Orders',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey[100],
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Text(
                //   'My Orders',
                //   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                // ),
                //SizedBox(height: size.height * 0.04),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             const MyOrderDetailsScreen()));
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      children: [
                                        Text(
                                          'Order DT5421CF',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    const Text(
                                      '12 Jun, 12.35 pm',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600),
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
                          ),
                          const DotDivider(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                const Text(
                                  '3 Items',
                                  style: TextStyle(
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
                                const Text(
                                  '₹ 21.50',
                                  style: TextStyle(
                                      color: Colors.grey,
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
                                      'In Transist',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: greencolor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.006,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             const MyOrderDetailsScreen()));/
                  },
                  child: SizedBox(
                    width: size.width,
                    child: Card(
                      elevation: 0,
                      // color: Colors.blueAccent,
                      // height: size.height * 0.12,
                      // width: size.width * 0.9,
                      // decoration: BoxDecoration(
                      //     color: Colors.black,
                      //     borderRadius: BorderRadius.circular(4)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Order DT6525RT',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    SizedBox(height: size.height * 0.01),
                                    const Text(
                                      '10 Jun, 04.58 pm',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600),
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
                          ),
                          const DotDivider(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                const Text(
                                  '6 Items',
                                  style: TextStyle(
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
                                const Text(
                                  '₹ 33.50',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                const Spacer(),
                                // SizedBox(
                                //   width: size.width * 0.25,
                                // ),
                                Container(
                                  height: size.height * 0.04,
                                  width: size.width * 0.19,
                                  color: Colors.blue[50],
                                  child: const Center(
                                    child: Text(
                                      'Delivered',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.006,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             const MyOrderDetailsScreen()));
                  },
                  child: SizedBox(
                    width: size.width,
                    child: Card(
                      elevation: 0,
                      // color: Colors.blueAccent,
                      // height: size.height * 0.12,
                      // width: size.width * 0.9,
                      // decoration: BoxDecoration(
                      //     color: Colors.black,
                      //     borderRadius: BorderRadius.circular(4)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Order DT5421CF',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 13),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    const Text(
                                      '08 Jun, 12.40 pm',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600),
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
                          ),
                          const DotDivider(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                const Text(
                                  '3 Items',
                                  style: TextStyle(
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
                                const Text(
                                  '₹ 33.50',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                // SizedBox(
                                //   width: size.width * 0.25,
                                // ),
                                const Spacer(),
                                Container(
                                  height: size.height * 0.04,
                                  width: size.width * 0.19,
                                  color: Colors.blue[50],
                                  child: const Center(
                                    child: Text(
                                      'Delivered',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.006,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             const MyOrderDetailsScreen()));
                  },
                  child: SizedBox(
                    width: size.width,
                    child: Card(
                      elevation: 0,
                      //color: redcolor,
                      // height: size.height * 0.12,
                      // width: size.width * 0.9,
                      // decoration: BoxDecoration(
                      //     color: Colors.black,
                      //     borderRadius: BorderRadius.circular(4)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Order DT5578CT',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 13),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    const Text(
                                      '05 Jun, 05.40 pm',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600),
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
                          ),
                          const DotDivider(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                const Text(
                                  '6 Items',
                                  style: TextStyle(
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
                                const Text(
                                  '₹ 21.50',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                const Spacer(),
                                // SizedBox(
                                //   width: size.width * 0.25,
                                // ),
                                Container(
                                  height: size.height * 0.04,
                                  width: size.width * 0.19,
                                  color: Colors.red[50],
                                  child: const Center(
                                    child: Text(
                                      'Cancelled',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.006,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             const MyOrderDetailsScreen()));
                  },
                  child: SizedBox(
                    width: size.width,
                    child: Card(
                      elevation: 0,
                      // color: Colors.blueAccent,
                      // height: size.height * 0.12,
                      // width: size.width * 0.9,
                      // decoration: BoxDecoration(
                      //     color: Colors.black,
                      //     borderRadius: BorderRadius.circular(4)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Order DT6525RT',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 13),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    const Text(
                                      '10 Jun, 04.58 pm',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600),
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
                          ),
                          const DotDivider(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                const Text(
                                  '6 Items',
                                  style: TextStyle(
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
                                const Text(
                                  '₹ 33.50',
                                  style: TextStyle(
                                      color: Colors.grey,
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
                                  color: Colors.blue[50],
                                  child: const Center(
                                    child: Text(
                                      'Delivered',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.006,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             const MyOrderDetailsScreen()));
                  },
                  child: SizedBox(
                    width: size.width,
                    child: Card(
                      elevation: 0,
                      // color: Colors.blueAccent,
                      // height: size.height * 0.12,
                      // width: size.width * 0.9,
                      // decoration: BoxDecoration(
                      //     color: Colors.black,
                      //     borderRadius: BorderRadius.circular(4)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Order DT5421CF',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 13),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    const Text(
                                      '08 Jun, 12.40 pm',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600),
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
                          ),
                          const DotDivider(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                const Text(
                                  '3 Items',
                                  style: TextStyle(
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
                                const Text(
                                  '₹ 33.50',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                // SizedBox(
                                //   width: size.width * 0.25,
                                // ),
                                const Spacer(),
                                Container(
                                  height: size.height * 0.04,
                                  width: size.width * 0.19,
                                  color: Colors.blue[50],
                                  child: const Center(
                                    child: Text(
                                      'Delivered',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.006,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             const MyOrderDetailsScreen()));
                  },
                  child: SizedBox(
                    width: size.width,
                    child: Card(
                      elevation: 0,
                      //color: redcolor,
                      // height: size.height * 0.12,
                      // width: size.width * 0.9,
                      // decoration: BoxDecoration(
                      //     color: Colors.black,
                      //     borderRadius: BorderRadius.circular(4)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Order DT5578CT',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 13),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    const Text(
                                      '05 Jun, 05.40 pm',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600),
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
                          ),
                          const DotDivider(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                const Text(
                                  '6 Items',
                                  style: TextStyle(
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
                                const Text(
                                  '₹ 21.50',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                const Spacer(),
                                // SizedBox(
                                //   width: size.width * 0.25,
                                // ),
                                Container(
                                  height: size.height * 0.04,
                                  width: size.width * 0.19,
                                  color: Colors.red[50],
                                  child: const Center(
                                    child: Text(
                                      'Cancelled',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.006,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             const MyOrderDetailsScreen()));
                  },
                  child: SizedBox(
                    width: size.width,
                    child: Card(
                      elevation: 0,
                      //color: redcolor,
                      // height: size.height * 0.12,
                      // width: size.width * 0.9,
                      // decoration: BoxDecoration(
                      //     color: Colors.black,
                      //     borderRadius: BorderRadius.circular(4)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Order DT5578CT',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 13),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    const Text(
                                      '05 Jun, 05.40 pm',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600),
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
                          ),
                          const DotDivider(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                const Text(
                                  '6 Items',
                                  style: TextStyle(
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
                                const Text(
                                  '₹ 21.50',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                const Spacer(),
                                // SizedBox(
                                //   width: size.width * 0.25,
                                // ),
                                Container(
                                  height: size.height * 0.04,
                                  width: size.width * 0.19,
                                  color: Colors.red[50],
                                  child: const Center(
                                    child: Text(
                                      'Cancelled',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DotDivider extends StatelessWidget {
  final double width;
  final double height;
  final double gap;
  final Color color;
  final double lineHeight;

  const DotDivider(
      {Key? key,
      this.height = 1.0,
      this.color = Colors.grey,
      this.width = 2.0,
      this.gap = 2.0,
      this.lineHeight = 10.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = width;
        final dashHeight = height;
        final dashCount = (boxWidth / dashWidth).floor();
        return Container(
          height: (lineHeight * 2) + height,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: dashCount,
            itemBuilder: (BuildContext context, int index) => Center(
              child: Container(
                width: dashWidth,
                height: dashHeight,
                margin:
                    EdgeInsets.symmetric(vertical: lineHeight, horizontal: gap),
                decoration: BoxDecoration(color: color),
              ),
            ),
          ),
        );
      },
    );
  }
}
