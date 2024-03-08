import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';

class PrivacyandPolicy extends StatefulWidget {
  const PrivacyandPolicy({super.key});

  @override
  State<PrivacyandPolicy> createState() => _PrivacyandPolicyState();
}

class _PrivacyandPolicyState extends State<PrivacyandPolicy> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: greencolor,
        title: const Text('Privacy and Policy',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
        
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        
          children: [
            Text('Privacy Policy for Local Farmers Market !',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15.0),),
            SizedBox(height: size.height*0.02),
            Text('At our local farmers market, we are committed to protecting the privacy of our customers, vendors, and visitors. Any personal information collected, such as names, contact details, or payment information, is used solely for the purpose of facilitating transactions and improving our services. We do not share or sell this information to third parties unless required by law or with explicit consent. We may collect non-personal information for analytics and marketing purposes, but this data is anonymized and aggregated to ensure individual privacy. By participating in our market or using our services, you agree to the terms of our privacy policy. If you have any questions or concerns about how we handle your information, please contact us.')
            
          ],
        ),
      ),
    );
  }
}