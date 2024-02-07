import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/CategoryProvider/allcategorywidget.dart';
import 'package:local_farmers_project/screens/CategoryProvider/categoryprovider.dart';
import 'package:local_farmers_project/screens/ExtraScreens/loadingscreen.dart';

import 'package:provider/provider.dart';




class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
    @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false)
        .getAllCategoryData(context: context);
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     final category = Provider.of<CategoryProvider>(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 85,
          elevation: 0,
          backgroundColor: backgroundcolor,
          automaticallyImplyLeading: false,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        backgroundColor: backgroundcolor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                category.loadingSpinner
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
                  : category.categories.isEmpty
                      ? Text('No Categories...')
                      : SizedBox(
                          height: size.height * 0.6,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: ListView.builder(
                            
                              scrollDirection: Axis.vertical,
                              itemCount: category.categories.length,
                              itemBuilder: (context, intex) {
                                return AllCategoryWidget(
                                  id:category.categories[intex].id,
                                  name: category.categories[intex].name,
                                  quantity: category.categories[intex].quantity,
                                  farmerid: category.categories[intex].farmerid,
                                
                             
                             
                                 
                                
                                );
                                
                              },
                            ),
                          ),
                        ),       
               
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) =>
                //                 const CategoryDashBoardScreen()));
                //   },
                //   child: Container(
                //     height: size.height * 0.06,
                //     width: size.width * 0.9,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(7),
                //         color: Colors.white),
                //     child: Row(
                //       children: [
                //         SizedBox(
                //           width: size.width * 0.03,
                //         ),
                //         Image.asset(
                //           'assets/cate.png',
                //           scale: 4,
                //         ),
                //         SizedBox(
                //           width: size.width * 0.04,
                //         ),
                //         const Text(
                //           'Fruits & Vegtables',
                //           style: TextStyle(
                //               fontWeight: FontWeight.w600, fontSize: 12),
                //         )
                //       ],
                //     ),
                //   ),
                // ),

                SizedBox(
                  height: size.height * 0.012,
                ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (context) =>
                //     //             const CategoryDashBoardScreen()));
                //   },
                //   child: Container(
                //     height: size.height * 0.06,
                //     width: size.width * 0.9,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(7),
                //         color: Colors.white),
                //     child: Row(
                //       children: [
                //         SizedBox(
                //           width: size.width * 0.03,
                //         ),
                //         Image.asset(
                //           'assets/categories2.png',
                //           scale: 4,
                //         ),
                //         SizedBox(
                //           width: size.width * 0.04,
                //         ),
                //         const Text(
                //           'Cooking Essentails',
                //           style: TextStyle(
                //               fontWeight: FontWeight.w600, fontSize: 12),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: size.height * 0.012,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (context) =>
                //     //             const CategoryDashBoardScreen()));
                //   },
                //   child: Container(
                //     height: size.height * 0.06,
                //     width: size.width * 0.9,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(7),
                //         color: Colors.white),
                //     child: Row(
                //       children: [
                //         SizedBox(
                //           width: size.width * 0.03,
                //         ),
                //         Image.asset(
                //           'assets/categories3.png',
                //           scale: 4,
                //         ),
                //         SizedBox(
                //           width: size.width * 0.04,
                //         ),
                //         const Text(
                //           'Nut & Dry Fruits',
                //           style: TextStyle(
                //               fontWeight: FontWeight.w600, fontSize: 12),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: size.height * 0.012,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (context) =>
                //     //             const CategoryDashBoardScreen()));
                //   },
                //   child: Container(
                //     height: size.height * 0.06,
                //     width: size.width * 0.9,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(7),
                //         color: Colors.white),
                //     child: Row(
                //       children: [
                //         SizedBox(
                //           width: size.width * 0.03,
                //         ),
                //         Image.asset(
                //           'assets/categories4.png',
                //           scale: 4,
                //         ),
                //         SizedBox(
                //           width: size.width * 0.04,
                //         ),
                //         const Text(
                //           'Drinks & Beverages',
                //           style: TextStyle(
                //               fontWeight: FontWeight.w600, fontSize: 12),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: size.height * 0.012,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (context) =>
                //     //             const CategoryDashBoardScreen()));
                //   },
                //   child: Container(
                //     height: size.height * 0.06,
                //     width: size.width * 0.9,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(7),
                //         color: Colors.white),
                //     child: Row(
                //       children: [
                //         SizedBox(
                //           width: size.width * 0.03,
                //         ),
                //         Image.asset(
                //           'assets/categories5.png',
                //           scale: 4,
                //         ),
                //         SizedBox(
                //           width: size.width * 0.04,
                //         ),
                //         const Text(
                //           'Ice Creams & Desserts',
                //           style: TextStyle(
                //               fontWeight: FontWeight.w600, fontSize: 12),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: size.height * 0.012,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (context) =>
                //     //             const CategoryDashBoardScreen()));
                //   },
                //   child: Container(
                //     height: size.height * 0.06,
                //     width: size.width * 0.9,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(7),
                //         color: Colors.white),
                //     child: Row(
                //       children: [
                //         SizedBox(
                //           width: size.width * 0.03,
                //         ),
                //         Image.asset(
                //           'assets/cate.png',
                //           scale: 4,
                //         ),
                //         SizedBox(
                //           width: size.width * 0.04,
                //         ),
                //         const Text(
                //           'Fruits & Vegtables',
                //           style: TextStyle(
                //               fontWeight: FontWeight.w600, fontSize: 12),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: size.height * 0.012,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (context) =>
                //     //             const CategoryDashBoardScreen()));
                //   },
                //   child: Container(
                //     height: size.height * 0.06,
                //     width: size.width * 0.9,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(7),
                //         color: Colors.white),
                //     child: Row(
                //       children: [
                //         SizedBox(
                //           width: size.width * 0.03,
                //         ),
                //         Image.asset(
                //           'assets/categories2.png',
                //           scale: 4,
                //         ),
                //         SizedBox(
                //           width: size.width * 0.04,
                //         ),
                //         const Text(
                //           'Cooking Essentails',
                //           style: TextStyle(
                //               fontWeight: FontWeight.w600, fontSize: 12),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: size.height * 0.012,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (context) =>
                //     //             const CategoryDashBoardScreen()));
                //   },
                //   child: Container(
                //     height: size.height * 0.06,
                //     width: size.width * 0.9,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(7),
                //         color: Colors.white),
                //     child: Row(
                //       children: [
                //         SizedBox(
                //           width: size.width * 0.03,
                //         ),
                //         Image.asset(
                //           'assets/categories3.png',
                //           scale: 4,
                //         ),
                //         SizedBox(
                //           width: size.width * 0.04,
                //         ),
                //         const Text(
                //           'Nut & Dry Fruits',
                //           style: TextStyle(
                //               fontWeight: FontWeight.w600, fontSize: 12),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: size.height * 0.012,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (context) =>
                //     //             const CategoryDashBoardScreen()));
                //   },
                //   child: Container(
                //     height: size.height * 0.06,
                //     width: size.width * 0.9,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(7),
                //         color: Colors.white),
                //     child: Row(
                //       children: [
                //         SizedBox(
                //           width: size.width * 0.03,
                //         ),
                //         Image.asset(
                //           'assets/categories4.png',
                //           scale: 4,
                //         ),
                //         SizedBox(
                //           width: size.width * 0.04,
                //         ),
                //         const Text(
                //           'Drinks & Beverages',
                //           style: TextStyle(
                //               fontWeight: FontWeight.w600, fontSize: 12),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: size.height * 0.012,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (context) =>
                //     //             const CategoryDashBoardScreen()));
                //   },
                //   child: Container(
                //     height: size.height * 0.06,
                //     width: size.width * 0.9,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(7),
                //         color: Colors.white),
                //     child: Row(
                //       children: [
                //         SizedBox(
                //           width: size.width * 0.03,
                //         ),
                //         Image.asset(
                //           'assets/categories5.png',
                //           scale: 4,
                //         ),
                //         SizedBox(
                //           width: size.width * 0.04,
                //         ),
                //         const Text(
                //           'Ice Creams & Desserts',
                //           style: TextStyle(
                //               fontWeight: FontWeight.w600, fontSize: 12),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: size.height * 0.012,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (context) =>
                //     //             const CategoryDashBoardScreen()));
                //   },
                //   child: Container(
                //     height: size.height * 0.06,
                //     width: size.width * 0.9,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(7),
                //         color: Colors.white),
                //     child: Row(
                //       children: [
                //         SizedBox(
                //           width: size.width * 0.03,
                //         ),
                //         Image.asset(
                //           'assets/cate.png',
                //           scale: 4,
                //         ),
                //         SizedBox(
                //           width: size.width * 0.04,
                //         ),
                //         const Text(
                //           'Fruits & Vegtables',
                //           style: TextStyle(
                //               fontWeight: FontWeight.w600, fontSize: 12),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: size.height * 0.012,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (context) =>
                //     //             const CategoryDashBoardScreen()));
                //   },
                //   child: Container(
                //     height: size.height * 0.06,
                //     width: size.width * 0.9,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(7),
                //         color: Colors.white),
                //     child: Row(
                //       children: [
                //         SizedBox(
                //           width: size.width * 0.03,
                //         ),
                //         Image.asset(
                //           'assets/categories2.png',
                //           scale: 4,
                //         ),
                //         SizedBox(
                //           width: size.width * 0.04,
                //         ),
                //         const Text(
                //           'Cooking Essentails',
                //           style: TextStyle(
                //               fontWeight: FontWeight.w600, fontSize: 12),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: size.height * 0.012,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (context) =>
                //     //             const CategoryDashBoardScreen()));
                //   },
                //   child: Container(
                //     height: size.height * 0.06,
                //     width: size.width * 0.9,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(7),
                //         color: Colors.white),
                //     child: Row(
                //       children: [
                //         SizedBox(
                //           width: size.width * 0.03,
                //         ),
                //         Image.asset(
                //           'assets/categories3.png',
                //           scale: 4,
                //         ),
                //         SizedBox(
                //           width: size.width * 0.04,
                //         ),
                //         const Text(
                //           'Nut & Dry Fruits',
                //           style: TextStyle(
                //               fontWeight: FontWeight.w600, fontSize: 12),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: size.height * 0.012,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (context) =>
                //     //             const CategoryDashBoardScreen()));
                //   },
                //   child: Container(
                //     height: size.height * 0.06,
                //     width: size.width * 0.9,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(7),
                //         color: Colors.white),
                //     child: Row(
                //       children: [
                //         SizedBox(
                //           width: size.width * 0.03,
                //         ),
                //         Image.asset(
                //           'assets/categories4.png',
                //           scale: 4,
                //         ),
                //         SizedBox(
                //           width: size.width * 0.04,
                //         ),
                //         const Text(
                //           'Drinks & Beverages',
                //           style: TextStyle(
                //               fontWeight: FontWeight.w600, fontSize: 12),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: size.height * 0.012,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (context) =>
                //     //             const CategoryDashBoardScreen()));
                //   },
                //   child: Container(
                //     height: size.height * 0.06,
                //     width: size.width * 0.9,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(7),
                //         color: Colors.white),
                //     child: Row(
                //       children: [
                //         SizedBox(
                //           width: size.width * 0.03,
                //         ),
                //         Image.asset(
                //           'assets/categories5.png',
                //           scale: 4,
                //         ),
                //         SizedBox(
                //           width: size.width * 0.04,
                //         ),
                //         const Text(
                //           'Ice Creams & Desserts',
                //           style: TextStyle(
                //               fontWeight: FontWeight.w600, fontSize: 12),
                //         )
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
