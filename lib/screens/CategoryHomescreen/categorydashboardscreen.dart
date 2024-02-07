import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:local_farmers_project/screens/CategoryHomescreen/freshfruitsscreen.dart';
import 'package:local_farmers_project/screens/CategoryHomescreen/freshfruitsscreen2.dart';
import 'package:local_farmers_project/screens/CategoryHomescreen/freshvegscreen.dart';
import 'package:local_farmers_project/screens/CategoryHomescreen/freshvegscreen2.dart';
import 'package:local_farmers_project/screens/CategoryHomescreen/herbsscreen.dart';
import 'package:local_farmers_project/screens/CategoryHomescreen/herbsscreen2.dart';
import 'package:local_farmers_project/screens/CategoryHomescreen/organicscreen.dart';
import 'package:local_farmers_project/screens/CategoryHomescreen/organicscreen2.dart';
import 'package:local_farmers_project/screens/CategoryHomescreen/summerfruitsscreen.dart';
import 'package:local_farmers_project/screens/CategoryHomescreen/summerfruitsscreen2.dart';

class CategoryDashBoardScreen extends StatefulWidget {
  const CategoryDashBoardScreen({Key? key}) : super(key: key);

  @override
  State<CategoryDashBoardScreen> createState() =>
      _CategoryDashBoardScreenState();
}

class _CategoryDashBoardScreenState extends State<CategoryDashBoardScreen> {
  int _selectedIndex = 0;

  void _onPageSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          LeftWidget(onPageSelected: _onPageSelected),
          Expanded(child: RightWidget(selectedIndex: _selectedIndex)),
        ],
      ),
    );
  }
}

class LeftWidget extends StatefulWidget {
  final Function(int) onPageSelected;

  const LeftWidget({Key? key, required this.onPageSelected}) : super(key: key);

  @override
  State<LeftWidget> createState() => _LeftWidgetState();
}

class _LeftWidgetState extends State<LeftWidget> with TickerProviderStateMixin {
  final List<String> _list = [
    "SUMMER FRUITS",
    "FRESH FRUITS",
    "FRESH VEGETABLES",
    "HERBS & SEASONING",
    "ORGANIC FRUITS",
    "SUMMER FRUITS",
    "FRESH FRUITS",
    "FRESH VEGETABLES",
    "HERBS & SEASONING",
    "ORGANIC FRUITS"
  ];
  final List<GlobalKey> _keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey()
  ];

  int _checkIndex = 0;
  Offset _checkedPositionOffset = Offset(0, 0);

  @override
  void initState() {
    _checkIndex = _list.length - 1;
    super.initState();

    SchedulerBinding.instance.endOfFrame.then((value) {
      _calculateCheckOffset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Container(
            width: 60,
            height: size.height,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: _buildList(),
            ),
          ),
          Positioned(
            top: _checkedPositionOffset.dy,
            left: _checkedPositionOffset.dx,
            child: CustomPaint(
              painter: CheckPointPainter(const Offset(33, 0)),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> _widgetList = [];

    // Add CircleAvatar as the first item
    _widgetList.add(
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
            padding: const EdgeInsets.only(top: 55, bottom: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            )),
      ),
    );

    // Add other menu items
    _widgetList.add(
      Expanded(
        child: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _indexChecked(index);
                widget.onPageSelected(index);
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 7),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: VerticalText(
                      _list[index], _keys[index], _checkIndex == index, () {
                    _indexChecked(index);
                    widget.onPageSelected(index);
                  }),
                ),
              ),
            );
          },
        ),
      ),
    );

    return _widgetList;
  }

  void _indexChecked(int i) {
    if (_checkIndex == i) return;
    setState(() {
      _checkIndex = i;
      _calculateCheckOffset();
    });
  }

  void _calculateCheckOffset() {
    RenderBox renderBox =
        _keys[_checkIndex].currentContext!.findRenderObject() as RenderBox;
    Offset widgetOffset = renderBox.localToGlobal(const Offset(0, 0));
    Size widgetSize = renderBox.size;
    _checkedPositionOffset = Offset(
      widgetOffset.dx + widgetSize.width,
      widgetOffset.dy + widgetSize.height,
    );
  }
}

class CheckPointPainter extends CustomPainter {
  double pointRadius = 5;
  double sideLength = 65;

  Offset offset;

  CheckPointPainter(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;
    paint.color = Colors.grey[100]!;

    // Calculate the vertices of the chevron shape
    double halfSide = sideLength / 2;
    Offset topVertex = offset - Offset(0, sideLength);
    Offset bottomLeftVertex = offset + Offset(-halfSide, -halfSide);
    Offset bottomRightVertex = offset - Offset(halfSide, halfSide);

    // Draw the chevron using path
    Path path = Path();
    path.moveTo(topVertex.dx, topVertex.dy);
    path.lineTo(offset.dx, offset.dy);
    path.lineTo(bottomLeftVertex.dx, bottomLeftVertex.dy);
    path.lineTo(bottomRightVertex.dx, bottomRightVertex.dy);
    path.close();
    canvas.drawPath(path, paint);

    // Draw circles at the top and bottom vertices
    canvas.drawCircle(topVertex, pointRadius, paint);
    canvas.drawCircle(offset, pointRadius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class VerticalText extends StatelessWidget {
  final String name;
  final bool checked;
  final GlobalKey globalKey;
  final VoidCallback onPressed;

  const VerticalText(
    this.name,
    this.globalKey,
    this.checked,
    this.onPressed,
  );

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      key: globalKey,
      quarterTurns: -1,
      child: GestureDetector(
        onTap: onPressed,
        child: Text(
          name,
          style: TextStyle(
              color: checked ? Colors.green : Colors.black,
              fontSize: 11,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class RightWidget extends StatelessWidget {
  final int selectedIndex;

  const RightWidget({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          FreshFruitsScreen(),
          FreshVegScreen(),
          HerbsScreen(),
          OrganicScreen(),
          SummerFruitsScreen(),
          FreshFruitsScreen2(),
          FreshVegScreen2(),
          HerbScreen2(),
          OrganicScreen2(),
          SummerFruitsScreen2()
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// import 'package:flutter/scheduler.dart';
// import 'package:gropot_project/screens/CategoryHomescreen/freshfruitsscreen.dart';
// import 'package:gropot_project/screens/CategoryHomescreen/freshvegscreen.dart';
// import 'package:gropot_project/screens/CategoryHomescreen/herbsscreen.dart';
// import 'package:gropot_project/screens/CategoryHomescreen/organicscreen.dart';
// import 'package:gropot_project/screens/CategoryHomescreen/summerfruitsscreen.dart';
// import 'package:gropot_project/screens/DashBoardScreen/categoriesscreen.dart';
// import 'package:gropot_project/screens/DashBoardScreen/favouritesscreen.dart';
// import 'package:gropot_project/screens/DashBoardScreen/homescreen.dart';
// import 'package:gropot_project/screens/DashBoardScreen/myordersscreen.dart';
// import 'package:gropot_project/screens/DashBoardScreen/supportscreen.dart';
// import 'package:gropot_project/screens/ProfileScreen/profilescreen.dart';

// class CategoryDashBoardScreen extends StatefulWidget {
//   const CategoryDashBoardScreen({Key? key}) : super(key: key);

//   @override
//   State<CategoryDashBoardScreen> createState() =>
//       _CategoryDashBoardScreenState();
// }

// class _CategoryDashBoardScreenState extends State<CategoryDashBoardScreen> {
//   int _selectedIndex = 0;

//   void _onPageSelected(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Row(
//         children: [
//           LeftWidget(onPageSelected: _onPageSelected),
//           Expanded(child: RightWidget(selectedIndex: _selectedIndex)),
//         ],
//       ),
//     );
//   }
// }

// class LeftWidget extends StatefulWidget {
//   final Function(int) onPageSelected;

//   const LeftWidget({Key? key, required this.onPageSelected}) : super(key: key);

//   @override
//   State<LeftWidget> createState() => _LeftWidgetState();
// }

// class _LeftWidgetState extends State<LeftWidget> with TickerProviderStateMixin {
//   List<String> _list = [
//     "SUMMER FRUITS",
//     "FRESH FRUITS",
//     "FRESH VEGETABLES",
//     "HERBS & SEASONING",
//     "ORGANIC FRUITS"
//   ];
//   List<GlobalKey> _keys = [
//     GlobalKey(),
//     GlobalKey(),
//     GlobalKey(),
//     GlobalKey(),
//     GlobalKey()
//   ];

//   int _checkIndex = 0;
//   Offset _checkedPositionOffset = Offset(0, 0);

//   @override
//   void initState() {
//     _checkIndex = _list.length - 1;
//     super.initState();

//     SchedulerBinding.instance.endOfFrame.then((value) {
//       _calculateCheckOffset();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Container(
//       color: Colors.black,
//       child: Stack(
//         children: [
//           Container(
//             width: 70,
//             height: size.height,
//             decoration: BoxDecoration(color: Colors.white),
//             child: ListView(
//               scrollDirection: Axis.vertical,
//               children: _buildList(),
//             ),
//           ),
//           Positioned(
//             top: _checkedPositionOffset.dy,
//             left: _checkedPositionOffset.dx,
//             child: CustomPaint(
//               painter: CheckPointPainter(const Offset(33, 0)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   List<Widget> _buildList() {
//     List<Widget> _widgetList = [];

//     // Add CircleAvatar as the first item
//     _widgetList.add(
//       Padding(
//         padding: const EdgeInsets.only(top: 41, bottom: 20),
//         child: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     );

//     // Add other menu items
//     for (int i = 0; i < _list.length; i++) {
//       _widgetList.add(
//         const Padding(padding: EdgeInsets.only(top: 10)),
//       );
//       _widgetList.add(
//         GestureDetector(
//           onTap: () {
//             _indexChecked(i);
//             widget.onPageSelected(i);
//           },
//           child: Padding(
//             padding: const EdgeInsets.only(bottom: 60),
//             child: Center(
//               child: VerticalText(_list[i], _keys[i], _checkIndex == i, () {
//                 _indexChecked(i);
//                 widget.onPageSelected(i);
//               }),
//             ),
//           ),
//         ),
//       );
//     }

//     return _widgetList;
//   }

//   void _indexChecked(int i) {
//     if (_checkIndex == i) return;
//     setState(() {
//       _checkIndex = i;
//       _calculateCheckOffset();
//     });
//   }

//   void _calculateCheckOffset() {
//     RenderBox renderBox =
//         _keys[_checkIndex].currentContext!.findRenderObject() as RenderBox;
//     Offset widgetOffset = renderBox.localToGlobal(const Offset(0, 0));
//     Size widgetSize = renderBox.size;
//     _checkedPositionOffset = Offset(
//       widgetOffset.dx + widgetSize.width,
//       widgetOffset.dy + widgetSize.height,
//     );
//   }
// }

// class CheckPointPainter extends CustomPainter {
//   double pointRadius = 5;
//   double sideLength = 50;

//   Offset offset;

//   CheckPointPainter(this.offset);

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()..style = PaintingStyle.fill;
//     paint.color = Colors.grey[100]!;

//     // Calculate the vertices of the chevron shape
//     double halfSide = sideLength / 2;
//     Offset topVertex = offset - Offset(0, sideLength);
//     Offset bottomLeftVertex = offset + Offset(-halfSide, -halfSide);
//     Offset bottomRightVertex = offset - Offset(halfSide, halfSide);

//     // Draw the chevron using path
//     Path path = Path();
//     path.moveTo(topVertex.dx, topVertex.dy);
//     path.lineTo(offset.dx, offset.dy);
//     path.lineTo(bottomLeftVertex.dx, bottomLeftVertex.dy);
//     path.lineTo(bottomRightVertex.dx, bottomRightVertex.dy);
//     path.close();
//     canvas.drawPath(path, paint);

//     // Draw circles at the top and bottom vertices
//     canvas.drawCircle(topVertex, pointRadius, paint);
//     canvas.drawCircle(offset, pointRadius, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }

// class VerticalText extends StatelessWidget {
//   final String name;
//   final bool checked;
//   final GlobalKey globalKey;
//   final VoidCallback onPressed;

//   VerticalText(
//     this.name,
//     this.globalKey,
//     this.checked,
//     this.onPressed,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return RotatedBox(
//       key: globalKey,
//       quarterTurns: -1,
//       child: GestureDetector(
//         onTap: onPressed,
//         child: Text(
//           name,
//           style: TextStyle(
//               color: checked ? Colors.green : Colors.black,
//               fontSize: 12,
//               fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }

// class RightWidget extends StatelessWidget {
//   final int selectedIndex;

//   const RightWidget({Key? key, required this.selectedIndex}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: IndexedStack(
//         index: selectedIndex,
//         children: [
//           FreshFruitsScreen(),
//           FreshVegScreen(),
//           HerbsScreen(),
//           OrganicScreen(),
//           SummerFruitsScreen()
//         ],
//       ),
//     );
//   }
// }
