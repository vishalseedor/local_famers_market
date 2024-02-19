// List<PagingProduct> _paginatedProductData = [];

// List<PagingProduct> _products = [];

// bool showLoadingIndicator = false;

// static const double dataPagerHeight = 70.0;

// @override
// void initState() {
//   super.initState();
//   _products = List.from(populateData());
// }

// void rebuildList() {
//   setState(() {});
// }

// Widget loadListView(BoxConstraints constraints) {
//   List<Widget> _getChildren() {
//     final List<Widget> stackChildren = [];

//     if (_products.isNotEmpty) {
//       stackChildren.add(ListView.custom(
//           childrenDelegate: CustomSliverChildBuilderDelegate(indexBuilder)));
//     }

//     if (showLoadingIndicator) {
//       stackChildren.add(Container(
//         color: Colors.black12,
//         width: constraints.maxWidth,
//         height: constraints.maxHeight,
//         child: Align(
//           alignment: Alignment.center,
//           child: CircularProgressIndicator(
//             strokeWidth: 3,
//           ),
//         ),
//       ));
//     }
//     return stackChildren;
//   }

//   return Stack(
//     children: _getChildren(),
//   );
// }

// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     theme: ThemeData(
//       primarySwatch: Colors.blue,
//       visualDensity: VisualDensity.adaptivePlatformDensity,
//     ),
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('Fruits'),
//       ),
//       body: LayoutBuilder(builder: (context, constraint) {
//         return Column(
//           children: [
//             Container(
//               height: constraint.maxHeight - dataPagerHeight,
//               child: loadListView(constraint),
//             ),
//             Container(
//               height: dataPagerHeight,
//               child: SfDataPagerTheme(
//                   data: SfDataPagerThemeData(
//                     itemBorderRadius: BorderRadius.circular(5),
//                   ),
//                   child: SfDataPager(
//                       rowsPerPage: 10,
//                      onPageNavigationStart: (pageIndex) {
//                          setState(() {
//                             showLoadingIndicator = true;
//                          });
//                        },
//                       onPageNavigationEnd: (pageIndex) {
//                         setState(() {
//                           showLoadingIndicator = false;
//                         });
//                        },
//                       delegate: CustomSliverChildBuilderDelegate(indexBuilder)
//                         ..addListener(rebuildList))),
//             )
//           ],
//         );
//       }),
//     ),
//   );
// }

// Widget indexBuilder(BuildContext context, int index) {
//   final PagingProduct data = _paginatedProductData[index];
//   return ListTile(
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//     title: LayoutBuilder(
//       builder: (context, constraint) {
//         return Container(
//             width: constraint.maxWidth,
//             height: 100,
//             child: Row(
//               children: [
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Container(
//                     clipBehavior: Clip.antiAlias,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Image.asset(data.image, width: 100, height: 100),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.fromLTRB(20, 10, 5, 5),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Container(
//                         width: constraint.maxWidth - 130,
//                         child: Text(data.name,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.black87,
//                                 fontSize: 15)),
//                       ),
//                       Container(
//                         width: constraint.maxWidth - 130,
//                         child: Text(data.weight,
//                             style: TextStyle(
//                                 color: Colors.black87, fontSize: 10)),
//                       ),
//                       Container(
//                         width: constraint.maxWidth - 130,
//                         child: Row(
//                           children: [
//                             Container(
//                               color: Colors.green.shade900,
//                               padding: EdgeInsets.all(3),
//                               child: Row(
//                                 children: [
//                                   Text('${data.reviewValue}',
//                                       textAlign: TextAlign.end,
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 13)),
//                                   SizedBox(width: 2),
//                                   Icon(
//                                     Icons.star,
//                                     color: Colors.white,
//                                     size: 15,
//                                   )
//                                 ],
//                               ),
//                             ),
//                             SizedBox(width: 5),
//                             Text('${data.ratings}',
//                                 textAlign: TextAlign.end,
//                                 style: TextStyle(
//                                     color: Colors.black87, fontSize: 11))
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: constraint.maxWidth - 130,
//                         child: Row(
//                           children: [
//                             Container(
//                               child: Text('\${data.price}',
//                                   style: TextStyle(
//                                       color: Colors.green.shade800,
//                                       fontSize: 13)),
//                             ),
//                             SizedBox(width: 8),
//                             Text('${data.offer}',
//                                 style: TextStyle(
//                                     color: Colors.black87, fontSize: 10))
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ));
//       },
//     ),
//   );
// }