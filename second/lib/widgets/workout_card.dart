import 'package:flutter/material.dart';

class workout_card extends StatelessWidget {
  final String image_path;
  final VoidCallback onTap;

  const workout_card({
    Key? key,
    required this.image_path,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          width: 400,
          height: 600,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage(image_path), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
