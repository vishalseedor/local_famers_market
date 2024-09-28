import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';

class Orderemptyscreen extends StatefulWidget {
  const Orderemptyscreen({super.key});

  @override
  State<Orderemptyscreen> createState() => _OrderemptyscreenState();
}

class _OrderemptyscreenState extends State<Orderemptyscreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const SizedBox(height: 100),
          Center(child: Image.asset('assets/empty.png',scale: 2)),
          Center(child: const Text('No Orders....',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
          SizedBox(height: size.height*0.02),
         
        ],
      );
    

  }
}