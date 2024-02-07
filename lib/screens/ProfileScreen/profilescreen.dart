import 'package:flutter/material.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/ProfileScreen/profileditscreen.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios)),
                      // Container(
                      //   height: size.height * 0.04,
                      //   width: size.width * 0.25,
                      //   decoration: BoxDecoration(
                      //     color: greencolor,
                      //     borderRadius: BorderRadius.circular(5),
                      //   ),
                      //   child: Center(
                      //       child: Text(
                      //     'Buy This App',
                      //     style: TextStyle(
                      //         color: Colors.white, fontWeight: FontWeight.w700),
                      //   )),
                      // )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Vishal',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'View Profile',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: greencolor),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfileEditScreen()));
                        },
                        child: CircleAvatar(
                          radius: 45,
                          child: Image.asset('assets/profile.png'),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                ],
              ),
            ),
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.language_sharp,
                              size: 25,
                              color: greencolor,
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            const Text('Change Language',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 31),
                          child: Text(
                            'English',
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.question_mark_sharp,
                              size: 25,
                              color: greencolor,
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            const Text('FAQs',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 31),
                          child: Text(
                            'Get your question answered',
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.book,
                              size: 25,
                              color: greencolor,
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            const Text('Terms & Conditions',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 31),
                          child: Text(
                            'Know terms of use',
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.privacy_tip,
                              size: 25,
                              color: greencolor,
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            const Text('Privacy Policy',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 31),
                          child: Text(
                            'Companies privacy policy',
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.logout,
                              size: 25,
                              color: greencolor,
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            const Text('Logout',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 31),
                          child: Text(
                            'Sign out from account',
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
