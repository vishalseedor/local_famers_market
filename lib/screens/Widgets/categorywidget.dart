import 'package:flutter/material.dart';

class CateoGoryWidget extends StatefulWidget {
  final String id;
  final String title;
  final String image;

  const CateoGoryWidget({
    super.key,
    required this.id,
    required this.title,
    required this.image,
   
  });

  @override
  State<CateoGoryWidget> createState() => _CateoGoryWidgetState();
}

class _CateoGoryWidgetState extends State<CateoGoryWidget> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
      
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(widget.image))),
              ),
              SizedBox(width: size.width*0.02),
              Text(widget.title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12),)
            ],
          ),
        ),
      ),
    );
  }
}
