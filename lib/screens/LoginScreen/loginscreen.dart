
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:local_farmers_project/screens/SideBottomNavigation/sidebottomnavigation.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               SizedBox(height: 70),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Image.asset('assets/farmer.png'),
                ),
                SizedBox(height: 50),
              //  const Spacer(),
                Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                 SizedBox(height: 20),
                TextField(
        
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),hintText:'Email',prefixIcon: const Icon(IconlyLight.message),fillColor: Colors.grey.withOpacity(0.2),filled: true),
                ),
                SizedBox(height: 20),
                    TextField(
        
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),hintText:'Password',prefixIcon: const Icon(IconlyLight.password),fillColor: Colors.grey.withOpacity(0.2),filled: true),
                ),
              
                /**/ SizedBox(height: 30),
                Center(
                  child: FilledButton.tonalIcon(
                    style: FilledButton.styleFrom(backgroundColor: Colors.brown),
                    onPressed: () {
                    Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const SideBottomNavigation()));
                    },
                    icon: const Icon(IconlyLight.login,color: Colors.white,),
                    label: const Text('Login',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  
                  ),
                ),
                 Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don t have a an account ?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        TextButton(onPressed: ()async{
                        //  Navigator.push(context,MaterialPageRoute(builder:(context)=>const RegisterationPage()));
                        }, child:Text('Register',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold))),
                      ],
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}