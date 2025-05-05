import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:te/domain/model/model.dart';
import 'package:te/extention/size_extention.dart';
import 'package:te/main.dart';
import 'package:te/presentation/home_screen/home_screen.dart';
import 'package:vibration/vibration.dart';

class TimerScreen extends StatefulWidget {
  final Item item;
  const TimerScreen({super.key, required this.item});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Timer timer;
  final Duration stopTime = Duration(seconds: 0);
  late Duration _remainingTime;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.item.timerDone;
    startTimer();
  }

  Future<void> showNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'timer_channel',
          'Таймер',
          importance: Importance.high,
          priority: Priority.high,
        );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(),
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      'Таймер завершен',
      'Время истекло!',
      details,
    );
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > const Duration(seconds: 0)) {
          _remainingTime -= const Duration(seconds: 1);
        } else {
          Vibration.hasVibrator().then((hasVibrator) {
            Vibration.vibrate(duration: 1500);
          });
          showNotification();
          timer.cancel();
          print("Таймер завершён!");
        }
      });
    });
  }

  void resetTimer() {
    if (timer.isActive) {
      timer.cancel();
    }
    setState(() {
      _remainingTime = widget.item.timerDone;
    });
    startTimer();
  }

  String formatTime(Duration duration) {
    int minutes = duration.inMinutes;
    int seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
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
                          Image.asset('asset/image/ex.jpg', scale: 5.5),
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
                        image: AssetImage('asset/image/hurt.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          _remainingTime != stopTime
                              ? "Your egg is ready in ..."
                              : "Your egg is done!",
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'PixelifySans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        _remainingTime != stopTime
                            ? Padding(
                              padding: const EdgeInsets.only(
                                top: 40,
                                right: 15,
                              ),
                              child: Column(
                                children: [
                                  Image.asset('asset/gif/wait.gif', scale: 1.3),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25.0),
                                    child: Text(
                                      formatTime(_remainingTime),
                                      style: TextStyle(
                                        fontSize: 44,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'PixelifySans',
                                        color: Color(0xFF451E09),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            : Padding(
                              padding: const EdgeInsets.only(
                                left: 12.0,
                                top: 0,
                              ),
                              child: Column(
                                children: [
                                  Image.asset('asset/gif/done.gif', scale: 1.1),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: resetTimer,
                                        child: Container(
                                          width: 120,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFDFC76E),
                                            border: Border.all(
                                              width: 2,
                                              color: Color(0xFFFEEA7A),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              13,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Snooze',
                                              style: TextStyle(
                                                fontSize: 24,
                                                color: Color(0xFF723312),
                                                fontFamily: 'PixelifySans',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            CupertinoPageRoute(
                                              builder:
                                                  (context) => HomeScreen(),
                                            ),
                                            (route) => false,
                                          );
                                        },
                                        child: Container(
                                          width: 120,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFDFC76E),
                                            border: Border.all(
                                              width: 2,
                                              color: Color(0xFFFEEA7A),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              13,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Close',
                                              style: TextStyle(
                                                fontSize: 24,
                                                color: Color(0xFF723312),
                                                fontFamily: 'PixelifySans',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  10.hBox,
                                ],
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
