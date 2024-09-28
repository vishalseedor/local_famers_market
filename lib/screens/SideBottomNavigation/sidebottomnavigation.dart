
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/CartScreen/mycartscreen.dart';
import 'package:local_farmers_project/screens/FarmerProvider/farmscreen.dart';
import 'package:local_farmers_project/screens/HomeScreen/homescreen.dart';
import 'package:local_farmers_project/screens/MyOrderScreen/design/orderpage.dart';
import 'package:local_farmers_project/screens/MyOrderScreen/myorderscreen.dart';
import 'package:local_farmers_project/screens/ProfileScreen/profilescreen.dart';
import 'package:local_farmers_project/screens/ShopCategoryScreen/shopcategoryscreen.dart';
import 'package:local_farmers_project/screens/SupportScreen/supportscreen.dart';


class SideBottomNavigation extends StatefulWidget {
  const SideBottomNavigation({Key? key}) : super(key: key);

  @override
  State<SideBottomNavigation> createState() => _SideBottomNavigationState();
}

class _SideBottomNavigationState extends State<SideBottomNavigation> {
  int _selectedIndex = 0;

  void _onPageSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            LeftWidget(onPageSelected: _onPageSelected),
            Expanded(child: RightWidget(selectedIndex: _selectedIndex)),
          ],
        ),
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
    "Home",
    "Category",
    "Orders",
    "Support",
    "Profile"
  ];

  final List<GlobalKey> _keys = [
    GlobalKey(),
    GlobalKey(),
    
    GlobalKey(),
    GlobalKey(),
    GlobalKey()
  
  ];

  int _checkIndex = 0;

  Offset _checkedPositionOffset = const Offset(0, 0);

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

    return SingleChildScrollView(
      child: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Container(
              width: 65,
              height: size.height,
              decoration:  const BoxDecoration(color: Colors.white),
              child: Column(
                children: _buildList(),
              ),
            ),
            Positioned(
              top: _checkedPositionOffset.dy,
              left: _checkedPositionOffset.dx,
              child: CustomPaint(
                painter: CheckPointPainter(const Offset(33, -10)),
              ),
            ),
          ],
        ),
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
          padding:  const EdgeInsets.only(top: 50, bottom: 40),
          child: CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage('assets/logo.png'),
            backgroundColor: Colors.green,
          ),
        ),
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
                padding: const EdgeInsets.only(bottom: 60, left: 6),
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

  double sideLength = 63;

  Offset offset;

  CheckPointPainter(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    paint.color = backgroundcolor!;

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
              fontSize: 13,
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
      backgroundColor: Colors.grey[200],
      body: IndexedStack(
        index: selectedIndex,
        children: [
          HomeScreen(),
          CategoryScreen(),
         OrdersScreen(),
          SupportScreen(),

         ProfileScreen(),
       

         
        ],
      ),
    );
  }
}
