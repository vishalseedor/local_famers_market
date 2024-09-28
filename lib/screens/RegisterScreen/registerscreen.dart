import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/LoginScreen/loginscreen.dart';
import 'package:local_farmers_project/screens/LoginScreen/roundbutton.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
final _formKey = GlobalKey<FormState>();
 late bool _passwordVisible;
Future<void>registerAdopter(

String name,String phone,String email,String password,String address,String state) async {
  const url = 'http://campus.sicsglobal.co.in/Project/farmers_Market/api/user_registration.php';

  Map<String, String> body = {
  
    'name':name,
    'phone': phone,
    'email': email,
    'password': password,
    'address': address,
    'state': state,
   // 'user_type': usertype,
    
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      body: body,
      
    );
     var jsonData=json.decode(response.body);


    if (response.statusCode == 200) {
       if(jsonData['status']==true){
          ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          backgroundColor: greencolor,
          content: const Text('Registration Successful!',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          duration: const Duration(seconds: 4),
        ),
      );
      Navigator.push(context,MaterialPageRoute(builder:(context)=> const LoginScreen()));
      print(body);
      print("Response body${response.body}"); 
    
      }
      print(body);
      print("Response body${response.body}");
      print('Registration successful');
    } else {
        ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          backgroundColor: Colors.white,
          content: Text('Already email and password Exists',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          duration: Duration(seconds: 4),
        ),
      );
      print('Error: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  }
}



  TextEditingController namecontroller=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passswordcontroller=TextEditingController();
  TextEditingController addresscontroller=TextEditingController();
  TextEditingController statecontroller=TextEditingController();
  //TextEditingController usertypecontroller=TextEditingController();
  @override
  void initState() {
    _passwordVisible = false;
  }

  

  @override
  Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/bg.jpg'),fit: BoxFit.cover)),
       child: SingleChildScrollView
       (
         child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      
                        const Center(
                          child: Text(
                            'REGISTER',
                            style:
                                TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                         const Text(
                          'Name',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold,),
                        ),
                        SizedBox(height: size.height * 0.01),
                        TextFormField(
                          
                           controller: namecontroller,
                          keyboardType: TextInputType.text,
                          decoration:  InputDecoration(
                            
                            fillColor: Colors.grey[300],
                            filled: true,
                            prefixIcon: const Icon(Icons.person_outline,color: Colors.black,),
                              // hintText: 'Enter Phone Number/Email ID/BN User Id',
                              hintText: 'Name',
                              hintStyle: const TextStyle(fontSize: 13),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none)),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'Please enter your name';
                                }
                              },
                        ),
                        SizedBox(height: size.height * 0.02),
                        const Text(
                          'Phone',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: size.height * 0.01),
                        TextFormField(
                          controller: phonecontroller,
                          keyboardType: TextInputType.phone,
                          decoration:  InputDecoration(
                             fillColor: Colors.grey[300],
                            filled: true,
                              prefixIcon: const Icon(Icons.mobile_screen_share_outlined,color:Colors.black),
                              hintText: 'Phone',
                              hintStyle: const TextStyle(fontSize: 13),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none)),
                               inputFormatters: [
    LengthLimitingTextInputFormatter(10), // Limits input to 10 characters
    FilteringTextInputFormatter.digitsOnly, // Allows only digits
  ],
                              validator: (value) {
    if (value!.isEmpty) {
      return 'Please enter your phone';
    } else if (value.length != 10) {
      return 'Phone number must be 10 digits';
    }
    return null;
  },
                        ),
                                   
                          SizedBox(height: size.height * 0.02),
                        const Text(
                          'Email',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: size.height * 0.01),
                        TextFormField(
                           controller: emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          decoration:  InputDecoration(
                             fillColor: Colors.grey[300],
                            filled: true,
                              prefixIcon: const Icon(Icons.email_outlined,color:Colors.black),
                              // hintText: 'Enter Phone Number/Email ID/BN User Id',
                              hintText: 'Email',
                              hintStyle: const TextStyle(fontSize: 13),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none)),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'Please enter your email';
                                }
                              },
                        ),
                          SizedBox(height: size.height * 0.02),
                        const Text(
                          'Password',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: size.height * 0.01),
                        TextFormField(
                          obscureText: _passwordVisible,
                         controller: passswordcontroller,
                          keyboardType: TextInputType.text,
                          decoration:  InputDecoration(
                             fillColor: Colors.grey[300],
                            filled: true,
                              prefixIcon: const Icon(Icons.lock_outline,color:Colors.black),
                               suffixIcon: IconButton(
            icon: Icon(
             
               _passwordVisible
               ? Icons.visibility_off
               : Icons.visibility,
               color: Colors.black
               ),
            onPressed: () {
           
               setState(() {
                   _passwordVisible = !_passwordVisible;
               });
             },
            ),
                             
                              hintText: 'Password',
                              hintStyle: const TextStyle(fontSize: 13),
                              
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none)),
                              inputFormatters: [
    LengthLimitingTextInputFormatter(8), // Limits input to 10 characters
    FilteringTextInputFormatter.singleLineFormatter, // Allows only digits
  ],
                            validator: (value) {
    if (value!.isEmpty) {
      return 'Please enter your phone';
    } else if (value.length != 8) {
      return 'Password must be 8 characters';
    }
    return null;
  },
                        ),
                          SizedBox(height: size.height * 0.02),
                        const Text(
                          'Address',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: size.height * 0.01),
                        TextFormField(
                           controller: addresscontroller,
                          keyboardType: TextInputType.text,
                          decoration:  InputDecoration(
                             fillColor: Colors.grey[300],
                            filled: true,
                              prefixIcon: const Icon(Icons.location_history_outlined,color:Colors.black),
                              // hintText: 'Enter Phone Number/Email ID/BN User Id',
                              hintText: 'Address',
                              hintStyle: const TextStyle(fontSize: 13),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none)),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'Please enter your address';
                                }
                              },
                        ),
                          SizedBox(height: size.height * 0.02),
                        const Text(
                          'State',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: size.height * 0.01),
                        TextFormField(
                          controller: statecontroller,
                          keyboardType: TextInputType.text,
                          decoration:  InputDecoration(
                             fillColor: Colors.grey[300],
                            filled: true,
                              prefixIcon: const Icon(Icons.location_city_outlined,color:Colors.black),
                              // hintText: 'Enter Phone Number/Email ID/BN User Id',
                              hintText: 'State',
                              hintStyle: const TextStyle(fontSize: 13),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none)),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'Please enter your state';
                                }
                              },
                        ),
                        //   SizedBox(height: size.height * 0.02),
                        // const Text(
                        //   'User type',
                        //   style: TextStyle(
                        //       color: Colors.black, fontWeight: FontWeight.bold),
                        // ),
                        // SizedBox(height: size.height * 0.01),
                        // TextFormField(
                        //   controller: usertypecontroller,
                        //   keyboardType: TextInputType.text,
                        //   decoration:  InputDecoration(
                        //      fillColor: Colors.grey[300],
                        //     filled: true,
                        //       prefixIcon: const Icon(Icons.person_outline,color:Colors.black),
                        //       // hintText: 'Enter Phone Number/Email ID/BN User Id',
                        //       hintText: 'User type',
                        //       hintStyle: const TextStyle(fontSize: 13),
                        //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none)),
                        //       validator: (value) {
                        //         if(value!.isEmpty){
                        //           return 'Please enter your usertype';
                        //         }
                        //       },
                        // ),
                       
                                    
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                                    
                        RoundButton(
                            title: 'Register',
                          
                            onTap: ()async {
                                if (_formKey.currentState!.validate()) {
                                  registerAdopter(
                                    namecontroller.text.toString(),
                                    phonecontroller.text.toString(),
                                    emailcontroller.text.toString(),
                                    passswordcontroller.text.toString(),
                                    addresscontroller.text.toString(),
                                    statecontroller.text.toString()
                                    //usertypecontroller.text.toString()
                     
                
                 );


                 await   Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ),
                    );
                  }  
                         
                            }),
                       
                          
                      
                      ],
                    ),
                  ),
                ),
       ),
      ),
    );
  }
}