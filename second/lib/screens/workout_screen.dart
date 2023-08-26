import 'package:flutter/material.dart';
import 'package:workout_screen/constants/custom_colors.dart';
import 'package:workout_screen/widgets/workout_card.dart';

class workout_screen extends StatefulWidget {
  const workout_screen({super.key});

  @override
  State<workout_screen> createState() => _workout_screenState();
}

class _workout_screenState extends State<workout_screen> {
  String workout_name = 'WORKOUT';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: custom_colors.bgGray,
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '종목을 찾아보세요',
                        style: TextStyle(
                          color: custom_colors.txtLightBlack,
                          fontSize: 30,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Text(
                        'your exercises',
                        style: TextStyle(
                          color: custom_colors.txtLightBlack,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: const Offset(-20, 0),
                  child: Container(
                    width: 440,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(80, 30, 0, 30),
                      child: Row(
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'TRY',
                                  style: TextStyle(
                                    color: custom_colors.txtBlack,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  workout_name,
                                  style: const TextStyle(
                                    color: custom_colors.txtBlack,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: custom_colors.txtBlack,
                      borderRadius: BorderRadius.circular(45)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        iconSize: 45,
                        color: Colors.white,
                        icon: const Icon(Icons.search_outlined),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  workout_card(
                    image_path: 'lib/assets/bench_press.jpg',
                    onTap: () {
                      setState(() {
                        workout_name = '"BENCH PRESS"';
                      });
                    },
                  ),
                  workout_card(
                    image_path: 'lib/assets/shoulder_press.jpg',
                    onTap: () {
                      setState(() {
                        workout_name = '"SHOULDER PRESS"';
                      });
                    },
                  ),
                  workout_card(
                    image_path: 'lib/assets/squat.jpg',
                    onTap: () {
                      setState(() {
                        workout_name = '"SQUAT"';
                      });
                    },
                  ),
                  workout_card(
                    image_path: 'lib/assets/lat_pull_down.jpg',
                    onTap: () {
                      setState(() {
                        workout_name = '"LAT PULL DOWN"';
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
