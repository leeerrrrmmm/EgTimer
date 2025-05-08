import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:te/extention/size_extention.dart';
import 'package:te/presentation/home_screen/home_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  void exitApp() {
    exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE288),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            height: 485,
            decoration: BoxDecoration(
              color: Color(0xFFFFD85D),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(width: 5, color: Color(0xFF723312)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 24, right: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Egg Timer <3',
                        style: TextStyle(
                          color: Color(0xFF723312),
                          fontFamily: 'PixelifySans',
                          fontSize: 28,
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset('asset/image/sm.jpg', scale: 5.5),
                          15.wBox,
                          GestureDetector(
                            onTap: exitApp,
                            child: Image.asset(
                              'asset/image/ex.jpg',
                              scale: 5.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  10.hBox,
                  Container(
                    height: 370,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Color(0xFF723312)),
                      image: DecorationImage(
                        image: AssetImage('asset/image/back.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Let's time your egg!",
                          style: TextStyle(
                            fontSize: 26,
                            fontFamily: 'PixelifySans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        10.hBox,
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          child: Container(
                            width: 180,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFDFC76E),
                              border: Border.all(
                                width: 2,
                                color: Color(0xFFFEEA7A),
                              ),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Center(
                              //text
                              child: Text(
                                'Start!',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Color(0xFF723312),
                                  fontFamily: 'PixelifySans',
                                ),
                              ),
                            ),
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
      ),
    );
  }
}
