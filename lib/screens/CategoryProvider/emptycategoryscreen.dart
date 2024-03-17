import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';

class EmptyCategoryScreen extends StatefulWidget {
  const EmptyCategoryScreen({super.key});

  @override
  State<EmptyCategoryScreen> createState() => _EmptyCategoryScreenState();
}

class _EmptyCategoryScreenState extends State<EmptyCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 200),
          Center(child: Image.asset('assets/emptycate.gif')),
          Center(child: const Text('Your Category is Empty....',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
          SizedBox(height: size.height*0.02),
         
        ],
      );
    

  }
}