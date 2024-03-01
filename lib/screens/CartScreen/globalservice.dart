import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/CartScreen/mycartscreen.dart';


class GlobalSnackBar {
  customSnackbar({
    required BuildContext context,
  }) {
    return SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 70,
            child: Row(
              children: [
                const Text(
                  '1 items',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                VerticalDivider(
                  color: greencolor,
                  thickness: 1,
                ),
                const Text(
                  '₹ 10.00',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )
              ],
            ),
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     const Text(
            //       'ITEM 1',
            //       style: TextStyle(fontSize: 10),
            //     ),
            //     Row(
            //       children: const [
            //         Text(
            //           '₹ 10.00',
            //           style: TextStyle(fontSize: 10),
            //         ),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         // const Text(
            //         //   'plus taxes',
            //         //   style: TextStyle(
            //         //       fontSize: 12, color: CustomColor.whitecolor),
            //         // )
            //       ],
            //     ),
            //     Text(
            //       'Product added Successfully',
            //       style: TextStyle(fontSize: 10),
            //     )
            //   ],
            // )
          ),
          InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  MyCartScreen()));
              },
              // navigation.currentIndex = 0;
              // Navigator.of(context).pushNamed(BottomAppScreen.routeName);
              // navigation.currentIndex = 2;
              // Navigator.of(context).pop(navigation.currentIndex = 2);
              // Navigator.of(context).pushNamed(MyCartScreen.routeName);

              // Get.to(() => const CartScreen());
              //  Get.to(CartScreen());

              child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6),
                      ),
                      color: greencolor),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.shopping_bag_rounded,
                          color: Colors.white,
                        ),
                        Text('VIEW CART',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )))
        ],
      ),
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
      // action: SnackBarAction(
      //   textColor: CustomColor.whitecolor,
      //   label: 'View cart',
      //   onPressed: () {},
      // ),
    );
  }

  generalSnackbar({required BuildContext context, required String text}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: SizedBox(
        height: 40,
        child: Center(
          child: Text(text),
        ),
      ),

      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: greencolor,
      duration: const Duration(milliseconds: 1500),
      behavior: SnackBarBehavior.floating,
      // action: SnackBarAction(
      //   textColor: CustomColor.whitecolor,
      //   label: 'View cart',
      //   onPressed: () {},
      // ),
    ));
  }

  successsnackbar({required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: SizedBox(
        height: 40,
        child: Center(
          child: Text(text),
        ),
      ),

      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: greencolor,
      duration: const Duration(milliseconds: 1500),
      behavior: SnackBarBehavior.floating,
      // action: SnackBarAction(
      //   textColor: CustomColor.whitecolor,
      //   label: 'View cart',
      //   onPressed: () {},
      // ),
    ));
  }
}
