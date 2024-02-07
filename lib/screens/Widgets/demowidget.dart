import 'package:flutter/material.dart';
import 'package:local_farmers_project/screens/GlobalService/globalservice.dart';


class DemoScreensss extends StatefulWidget {
  const DemoScreensss({super.key});

  @override
  State<DemoScreensss> createState() => _DemoScreensssState();
}

class _DemoScreensssState extends State<DemoScreensss> {
  final GlobalSnackBar _snackbar = GlobalSnackBar();
  bool isVisible = false;

  void _toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });

    if (isVisible) {
      ScaffoldMessenger.of(context).showSnackBar(
        _snackbar.customSnackbar(context: context),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(3),
              bottomLeft: Radius.circular(3),
              topRight: Radius.circular(1),
              bottomRight: Radius.circular(1),
            ),
          ),
          child: InkWell(
            onTap: _toggleVisibility,
            child: const Icon(Icons.add, color: Colors.white, size: 13),
          ),
        ),
        if (isVisible)
          Container(
          height: 30,
          width: 30,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(3),
                bottomRight: Radius.circular(3),
              ),
            ),
            child: const Row(
              children: [
                Center(
                  child: Text(
                    '1',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 13,
                ),
              ],
            ),
          ),
      ],
    );
  }
}

