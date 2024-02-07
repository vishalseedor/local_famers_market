import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/ExtraScreens/circle.dart';


class LoadingScreen extends StatelessWidget {
  final String title;
  const LoadingScreen({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitCircle(
            size: 50,
            itemBuilder: (context, index) {
              final colors = [greencolor, Colors.black];
              final color = colors[index % colors.length];
              return DecoratedBox(
                  decoration:
                      BoxDecoration(color: color, shape: BoxShape.circle));
            },
          ),
          Text(
            'Loading',
            style: TextStyle(
                color: greencolor, fontSize: 12, fontWeight: FontWeight.bold),
          )
          // Container(
          //   height: 40,
          //   width: 100,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(6), color: redcolor),
          //   child: Center(
          //       child: Text(
          //     title,
          //     style: const TextStyle(
          //         color: Colors.white, fontWeight: FontWeight.bold),
          //   )),
          // )
        ],
      ),
    );
  }
}
