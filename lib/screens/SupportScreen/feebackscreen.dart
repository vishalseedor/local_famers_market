import 'package:flutter/material.dart';

class FeedbackSuccessScreen extends StatefulWidget {
  const FeedbackSuccessScreen({super.key});

  @override
  State<FeedbackSuccessScreen> createState() => _FeedbackSuccessScreenState();
}

class _FeedbackSuccessScreenState extends State<FeedbackSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/feedback.png',scale: 4,)),
          SizedBox(height: size.height*0.02,),
          const Text('Feedback Added successfully',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}