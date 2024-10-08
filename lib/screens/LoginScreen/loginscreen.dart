import 'dart:convert';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/LoginScreen/loginmodel.dart';
import 'package:local_farmers_project/screens/LoginScreen/roundbutton.dart';
import 'package:local_farmers_project/screens/ProfileScreen/usermodel.dart';
import 'package:local_farmers_project/screens/RegisterScreen/registerscreen.dart';
import 'package:local_farmers_project/screens/SideBottomNavigation/sidebottomnavigation.dart';
import 'package:local_farmers_project/screens/UserProvider/userprovider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    late bool _passwordVisible;
  bool rememberMe = true;
  bool loading = false;

  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  LoginModel? loginModel;

  void loginAdopter(String phone, String password) async {
    
    print(phone);
    print(password);
    const url =
        'http://campus.sicsglobal.co.in/Project/farmers_Market/api/user_login.php';

    Map<String, String> body = {'phone': phone, 'password': password};

    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
      );
      print(url);
      var jsonData = json.decode(response.body);
      print(jsonData);
      print(jsonData["status"]);
      if (response.statusCode == 200) {
        if (jsonData['status'] == true) {
          //      getstorage.write("phone",loginModel!.phone.toString());
          // getstorage.write("password",loginModel!.password.toString());
          // getstorage.read(phone);
          // phone=getstorage.read("phone");

          List user = jsonData['userData'];
          if (user.isNotEmpty) {
            UserData userdata = UserData.fromJson(user[0]);
            String userId = userdata.id;
            Provider.of<UserProvider>(context, listen: false)
                .setCurrentUserId(userId);
            print(userId);
          }
           AnimatedSnackBar.rectangle(
                    'Welcome !',
                    'Login Successful !',
                    mobileSnackBarPosition: MobileSnackBarPosition.top,
                    type: AnimatedSnackBarType.success,
                   // brightness: Brightness.dark,
                  ).show(
                    context,
                  );

          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     backgroundColor: greencolor,
          //     content: const Text(
          //       'Login Successful!',
          //       style:
          //           TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          //     ),
          //     duration: const Duration(seconds: 4),
          //   ),
          // );

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SideBottomNavigation()));
          print(body);
          print("Response body${response.body}");

          print('Login successful');
        } else if (jsonData['status'] == false) {
           AnimatedSnackBar.rectangle(
                    'Warning',
                    'Invalid Phone and Password !',
                    type: AnimatedSnackBarType.warning,
                     mobileSnackBarPosition: MobileSnackBarPosition.top,
                    // brightness: Brightness.dark,
                  ).show(
                    context,
                  );
          // ignore: use_build_context_synchronously
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     backgroundColor: greencolor,
          //     content: const Text(
          //       'Invalid phone and password',
          //       style:
          //           TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          //     ),
          //     duration: const Duration(seconds: 4),
          //   ),
          // );
          print('Error: ${response.statusCode}');
        }
      } else {
        print('fffff');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final userdata = Provider.of<UserProvider>(context);
    return SafeArea(
      child: Scaffold(
       
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg.jpg'),
                    fit: BoxFit.cover)),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/login_page.webp',
                            height: 280,
                            width: 3500,
                          ),
                        ),
                        const Center(
                          child: Text(
                            'LOGIN ',
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        const Text(
                          'Phone',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        TextFormField(
                          controller: phonecontroller,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              fillColor: Colors.grey[300],
                              filled: true,
                              prefixIcon: const Icon(
                                Icons.phone_android_outlined,
                                color: Colors.black,
                              ),
                              // hintText: 'Enter Phone Number/Email ID/BN User Id',
                              hintText: 'Phone',
                              hintStyle: const TextStyle(fontSize: 13),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none)),
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
                        SizedBox(height: size.height * 0.03),
                        const Text(
                          'Password',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: size.height * 0.01),
                        TextFormField(
                          obscureText: _passwordVisible,
                          controller: passwordcontroller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              fillColor: Colors.grey[300],
                              filled: true,
                              prefixIcon:
                              const Icon(Icons.lock_outline, color: Colors.black),
                              suffixIcon: IconButton(
            icon: Icon(
             
               _passwordVisible
               ? Icons.visibility
               : Icons.visibility_off,
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
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none)),
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
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Row(
                              //   children: [
                              //     GestureDetector(
                              //       onTap: () {
                              //         rememberMe = !rememberMe;
                              //         setState(() {});
                              //       },
                              //       child: Container(
                              //         //margin: const EdgeInsets.only(left: 7),
                              //         width: size.width * 0.05,
                              //         height: size.height * 0.025,
                              //         decoration: BoxDecoration(
                              //             color: Colors.white,
                              //             borderRadius: BorderRadius.circular(2),
                              //             border: Border.all(
                              //                 color: rememberMe
                              //                     ? Colors.blue
                              //                     : Colors.black)),
                              //         child: Center(
                              //             child: rememberMe
                              //                 ? const Icon(
                              //                     Icons.done,
                              //                     size: 15,
                              //                     color: Colors.black,
                              //                   )
                              //                 : Container()),
                              //       ),
                              //     ),
                              //     const SizedBox(
                              //       width: 15,
                              //     ),
                              //     // const Text(
                              //     //   'Remember me',
                              //     //   style: TextStyle(color: Colors.white),
                              //     // )
                              //   ],
                              // ),
                              InkWell(
                                onTap: () {},
                                child: const Text(
                                  '',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: size.height * 0.02,
                        // ),
                        RoundButton(
                            title: 'Login',
                            loading: loading,
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                loginAdopter(
                                  phonecontroller.text.toString(),
                                  passwordcontroller.text.toString(),
                                );
                              }
                            }),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account ?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterScreen()));
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
