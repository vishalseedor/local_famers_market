import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';

class TermsandConditions extends StatefulWidget {
  const TermsandConditions({super.key});

  @override
  State<TermsandConditions> createState() => _TermsandConditionsState();
}

class _TermsandConditionsState extends State<TermsandConditions> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: greencolor,
        title: const Text('Terms & Conditions',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('1 . Vendor Eligibility :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
              const Text('Only local farmers, producers, artisans, and vendors who meet the markets criteria may participate.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
              SizedBox(height: size.height*0.02),
                const Text('2 .Product Eligibility :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('Products sold must be locally grown, produced, or crafted by the vendor. Products should adhere to any relevant health and safety regulations.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
               SizedBox(height: size.height*0.02),
              const Text('3 .Application Process :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                const Text('Vendors may need to complete an application process, providing information about their products, production methods, and any necessary permits or licenses',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                SizedBox(height: size.height*0.02),
                 const Text('4 .Fees :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('There may be fees associated with participating in the market, including booth rental fees or membership dues.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                    SizedBox(height: size.height*0.02),
                 const Text('5 .Booth Assignments :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('Booth spaces may be assigned by the market manager or through a lottery system. Vendors may be required to set up within designated areas.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                     SizedBox(height: size.height*0.02),
                 const Text('5 .Setup and Tear Down :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('Vendors are responsible for setting up and tearing down their booths within specified times.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                SizedBox(height: size.height*0.02),
                 const Text('6 .Market Rules :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text(' Vendors must follow any additional rules or guidelines set forth by the market organizers.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
               SizedBox(height: size.height*0.02),
                 const Text('7 .Cancellation Policy:',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text(' Vendors should adhere to any cancellation policies outlined by the market, including notifying organizers in advance if they are unable to attend..',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
            
            ]
            ,
          ),
        ),
      ),
    );
  }
}