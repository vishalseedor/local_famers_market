import 'package:flutter/material.dart';

class CateoGoryWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final Function() ontap;
  const CateoGoryWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 7,
              ),
              Image.asset(
                image,
                scale: 3.5,
              ),
              const SizedBox(
                width: 6,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                        )),
                    Text(
                      subtitle,
                      style: const TextStyle(
                          fontSize: 9, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
