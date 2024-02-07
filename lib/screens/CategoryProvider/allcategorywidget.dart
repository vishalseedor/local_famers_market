import 'package:flutter/material.dart';



class AllCategoryWidget extends StatefulWidget {
  final String id;
  final String name;
  final String quantity;
  final String farmerid;
 
  

  const AllCategoryWidget(
      {super.key,
     required this.id,
     required this.name,
     required this.quantity,
     required this.farmerid,
    
      });

  @override
  State<AllCategoryWidget > createState() => _AllCategoryWidgetState ();
}

class _AllCategoryWidgetState extends State<AllCategoryWidget > {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //  final pet = Provider.of<PetModel>(context);

     return   GestureDetector(
                  onTap: () {
                   
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:5),
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Image.asset(
                            'assets/cate.png',
                            scale: 4,
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                           Text(
                            widget.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                );
  }
}
