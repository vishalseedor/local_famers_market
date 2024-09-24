import 'package:flutter/material.dart';
import 'package:local_farmers_project/screens/CategoryEachproductScreen/allcategoryeachscreen.dart';
import 'package:local_farmers_project/screens/CategoryEachproductScreen/categoryeachproductscreen.dart';
import 'package:local_farmers_project/screens/ShopCategoryScreen/shopcategoryscreen.dart';

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
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AllCategoryEachScreen(cateproduct: widget.id)));
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
                  height: 40,
                  width: 35,
                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(widget.image)),borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(width: size.width*0.02),
                Text(widget.title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
