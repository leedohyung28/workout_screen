import 'package:flutter/material.dart';
import 'package:first/constants/custom_colors.dart';

class workout_screen extends StatefulWidget {
  const workout_screen({super.key});

  @override
  State<workout_screen> createState() => _workout_screenState();
}

class _workout_screenState extends State<workout_screen> {
  int calorie = 0;
  late ScrollController _scrollController;
  final DateTime _baseDate = DateTime.now();
  int _currentIndex = 2;

  @override
  void initState() {
    super.initState();
    _scrollController =
        ScrollController(initialScrollOffset: 2 * 100.0) // Start at the middle
          ..addListener(() {
            int newIndex = (_scrollController.offset / 100.0).round();
            if (newIndex != _currentIndex) {
              setState(() {
                _currentIndex = newIndex;
              });
            }
          });
  }

  String _monthToString(int month) {
    List<String> monthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return monthNames[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: custom_colors.bgGray,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '안녕하세요 회원님,',
                          style: TextStyle(
                            color: custom_colors.txtLightBlack,
                            fontSize: 30,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        Text(
                          'Your Dashboard',
                          style: TextStyle(
                            color: custom_colors.txtLightBlack,
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: PageView.builder(
                      controller: PageController(
                          viewportFraction: 0.2, initialPage: _currentIndex),
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        DateTime currentDate =
                            _baseDate.add(Duration(days: index - 2));

                        double opacity = (index == _currentIndex) ? 1.0 : 0.2;

                        return Opacity(
                          opacity: opacity,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${currentDate.day}",
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  _monthToString(currentDate.month),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 600,
                    width: 700,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '$calorie Kcal',
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: custom_colors.kcalRed,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Current Balance',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: custom_colors.kcalRed,
                                  ),
                                ),
                              ]),
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
    );
  }
}
