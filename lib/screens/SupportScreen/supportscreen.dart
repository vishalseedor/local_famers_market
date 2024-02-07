import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';


class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  String dropdownvalue = 'Select Subject';
  var items = [
    'Select Subject',
    'Vegtables',
    'Fruits',
    'Nuts',
    'Herbs',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundcolor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Support',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  'Let us know your',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'feedback & queries',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
                Card(
                  shadowColor: Colors.grey,
                  // height: size.height * 0.048,
                  // width: size.width * 0.90,
                  // decoration: BoxDecoration(
                  //   boxShadow: [
                  //     BoxShadow(
                  //         color: Colors.grey.withOpacity(0.4),
                  //         spreadRadius: 1,
                  //         blurRadius: 1)
                  //   ],
                  //   color: Colors.white,
                  //   borderRadius: BorderRadius.circular(5),
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Call us',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        Icon(
                          Icons.call,
                          color: greencolor,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Card(
                  // height: size.height * 0.048,
                  // width: size.width * 0.90,
                  // decoration: BoxDecoration(
                  //   color: Colors.white,
                  //   borderRadius: BorderRadius.circular(5),
                  //   boxShadow: [
                  //     BoxShadow(
                  //         color: Colors.grey.withOpacity(0.4),
                  //         spreadRadius: 1,
                  //         blurRadius: 1)
                  //   ],
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Email us',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        Icon(
                          Icons.email,
                          color: greencolor,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                const Text(
                  'Write us',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.002,
                ),
                Text(
                  'Enter your message',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Container(
                    height: size.height * 0.05,
                    width: size.width * 0.9,
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text(
                          'Select Subject',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: dropdownvalue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    )),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 1),
                //   child: Container(
                //     height: size.height * 0.05,
                //     width: size.width * 0.90,
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         border: Border.all(color: Colors.white),
                //         boxShadow: [
                //           BoxShadow(
                //               color: Colors.grey.withOpacity(0.4),
                //               spreadRadius: 1,
                //               blurRadius: 1)
                //         ],
                //         // color: affnityBottomAppBarBackgroundColor,
                //         borderRadius: BorderRadius.circular(5)),
                //     child: Center(
                //       child: Padding(
                //         padding: const EdgeInsets.only(left: 20),
                //         child: TextField(
                //           keyboardType: TextInputType.text,
                //           decoration: InputDecoration(
                //             hintText: "Select subject",
                //             suffixIcon: Icon(
                //               Icons.expand_more,
                //               color: greencolor,
                //             ),
                //             hintStyle: const TextStyle(color: Colors.grey),
                //             border: InputBorder.none,
                //             focusedBorder: InputBorder.none,
                //           ),
                //           style: const TextStyle(color: Colors.white),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Container(
                    height: size.height * 0.1,
                    width: size.width * 0.90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      // color: affnityBottomAppBarBackgroundColor,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 1)
                      ],
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Write here",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SizedBox(
                  height: size.height * 0.047,
                  width: size.width * 0.88,
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: greencolor),
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const HomePage()));
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )),
                ),
                SizedBox(height: size.height * 0.07),
                Image.asset(
                  'assets/contact_footer.png',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
