import 'package:flutter/material.dart';
import 'package:local_farmers_project/screens/CartScreen/cartscreen.dart';
import 'package:local_farmers_project/screens/FarmerProvider/farmprovider.dart';
import 'package:provider/provider.dart';



class FarmerDetailsScreen extends StatefulWidget {
   static const routeName = 'farmer_details_screen';
  final String id;
  const FarmerDetailsScreen({Key? key,required this.id}) : super(key: key);

  @override
  State<FarmerDetailsScreen> createState() => _FarmerDetailsScreenState();
}

class _FarmerDetailsScreenState extends State<FarmerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
      final farmer = Provider.of<FarmProvider>(context,listen: false);
      final farmerData =
        Provider.of<FarmProvider>(context).farmers.firstWhere((element) => element.id == widget.id);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Farmer Details',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          // IconButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const CartScreen()),
          //     );
          //   },
          //   icon: const Stack(
          //     alignment: Alignment.center,
          //     children: [
          //       Icon(
          //         Icons.favorite_outline,
          //         color: Colors.black,
          //         size: 28,
          //       ),
          //       Positioned(
          //         bottom: 1,
          //         child: Text(
          //           '',
          //           style: TextStyle(
          //             color: Colors.black,
          //             fontSize: 12,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    farmerData.file,
                    // height: size.height * 0.3, // Responsive image height
                    // width: size.width * 0.8, // Responsive image width
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                "Farmer Name : ${farmerData.name}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
                SizedBox(height: size.height * 0.02),
              Text(
                'Email : ${farmerData.email}',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
                SizedBox(height: size.height * 0.02),
              Text('Phone : ${farmerData.phone}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.brown),),
              SizedBox(height: size.height * 0.02),
              Text('Farm Name : ${farmerData.farmName}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                 SizedBox(height: size.height * 0.02),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Address  :  ${farmerData.address}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
              //   DemoScreensss()
                ],
              ),
             
           
            ],
          ),
        ),
      ),
    );
  }
}
