import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';
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
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Farm Details',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
        backgroundColor: greencolor,
        elevation: 0,
     
    
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    farmerData.file,
                  
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                "Farmer Name : ${farmerData.name}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
                SizedBox(height: size.height * 0.02),
                            Text(
                              'Email : ${farmerData.email}',
                              style: const TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                             
                              SizedBox(height: size.height * 0.02),
                            Text('Phone : ${farmerData.phone}',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.brown),),
                            SizedBox(height: size.height * 0.02),
                            Text('Farm Name : ${farmerData.farmName}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                               SizedBox(height: size.height * 0.02),
             
               Text(
                 'Address  :  ${farmerData.address}',
                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
               ),
             
           
            ],
          ),
        ),
      ),
    );
  }
}
