import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:local_farmers_project/screens/FarmerProvider/farmdetailsscreen.dart';

class AllFarmersWidget extends StatefulWidget {
  final String id;
  final String name;
  final String image;
  final String farmname;
  final String address;
  final String email;
  final String farmstatus;
  

  const AllFarmersWidget(
      {super.key,
     required this.id,
     required this.name,
     required this.image,
     required this.farmname,
     required this.address,
     required this.email,
     required this.farmstatus

      });

  @override
  State<AllFarmersWidget > createState() => _AllPetWidgetState();
}

class _AllPetWidgetState extends State<AllFarmersWidget > {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //  final pet = Provider.of<PetModel>(context);
   return GestureDetector(
      onTap: () {
               Navigator.of(context).pushNamed(FarmerDetailsScreen.routeName,arguments:widget.id);
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //       builder: (_) => ProductDetailsPage(product: product)),
        // );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Card(
          
          color: Colors.grey[300],
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          elevation: 0.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(                                               
                height: 130,
                alignment: Alignment.topRight,
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.cover,
                  ),   
                ),
                // child: SizedBox(
                //   width: 30,
                //   height: 30,
                //   child: IconButton.filledTonal(
                //     padding: EdgeInsets.zero,
                //     onPressed: () {}, 
                //     iconSize: 18,
                //     icon: const Icon(IconlyLight.bookmark),
                //   ),
                // ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Text(
                        widget.farmname,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: widget.address,
                                  style: Theme.of(context).textTheme.bodyLarge),
                                  
                              TextSpan(
                                  text: widget.email,
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   width: 30,
                        //   height: 30,
                        //   child: IconButton.filled(
                        //     padding: EdgeInsets.zero,
                        //     onPressed: () {},
                        //     iconSize: 18,
                        //     icon: const Icon(Icons.add),
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

    //  return       Padding(
    //                         padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    //                         child: InkWell(
    //                           onTap: (){
    //                              Navigator.of(context).pushNamed(FarmerDetailsScreen.routeName,arguments:widget.id);
    //                           },
    //                           child: Card(
    //                             color:Colors.grey[300],
    //                             child: ListTile(
    //                               leading: ClipRRect(
    //                                 borderRadius: BorderRadius.circular(10),
    //                                 child: Image.network(widget.image)),
    //                                        title: Text(widget.farmname,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
    //                                          subtitle: Column(
    //                                           crossAxisAlignment: CrossAxisAlignment.start,
    //                                            children: [
    //                                              Text('Address : ${widget.address}',style: TextStyle(color: Colors.brown,fontWeight: FontWeight.bold,fontSize: 11),),
    //                                              SizedBox(height: 20),
    //                                               Text(widget.email,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
    //                                            ],
    //                                          ),
    //                                          trailing: Container(
    //                                           height: 30,
    //                                           width: 30,
                                            
    //                                           decoration: BoxDecoration(  color: greencolor,borderRadius: BorderRadius.circular(8)),
    //                                           child: Center(child: Text(widget.farmstatus,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),)),
    //                                          ),
    //                             //                 trailing: Icon(
    //                             //     Icons.arrow_forward_ios,
    //                             //     color: Colors.lightBlueAccent,
    //                             // ),
    //                                    ),
                                
                                
                               
    //                             ),
    //                         ),
    //                         );
                        
  }
}
