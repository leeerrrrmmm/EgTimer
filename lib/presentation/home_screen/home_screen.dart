import 'dart:io';

import 'package:flutter/material.dart';
import 'package:te/domain/provider/model_provider.dart';
import 'package:te/extention/size_extention.dart';
import 'package:te/presentation/timer_screen/timer_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ItemRepo itemRepo = ItemRepo(); // Создаём репозиторий

  void exitApp() {
    exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE288),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            height: 485,
            decoration: BoxDecoration(
              color: const Color(0xFFFFD85D),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(width: 5, color: const Color(0xFF723312)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 24, right: 24),
              child: Column(
                children: [
                  // Заголовок
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Egg Timer <3',
                        style: TextStyle(
                          color: Color(0xFF723312),
                          fontFamily: 'PixelifySans',
                          fontSize: 28,
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset('asset/image/sm.jpg', scale: 5),
                          15.wBox,
                          GestureDetector(
                            onTap: exitApp,
                            child: Image.asset('asset/image/ex.jpg', scale: 5),
                          ),
                        ],
                      ),
                    ],
                  ),
                  10.hBox,
                  // Контейнер с фоном
                  Container(
                    height: 370,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: const Color(0xFF723312),
                      ),
                      image: const DecorationImage(
                        image: AssetImage('asset/image/backf.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        children: [
                          const Text(
                            "What are you making today?",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'PixelifySans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // Динамическое отображение элементов
                          Expanded(
                            child: GridView.builder(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              itemCount: itemRepo.eggTimer.items.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    childAspectRatio: 0.8,
                                  ),
                              itemBuilder: (context, index) {
                                final item = itemRepo.eggTimer.items[index];
                                return GestureDetector(
                                  onTap: () {
                                    print(
                                      "Выбрано: ${item.name}, изображение: ${item.imagePath}, time: ${item.timerDone.toString()}",
                                    );
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) =>
                                                TimerScreen(item: item),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(item.imagePath, scale: 2.1),
                                      Text(
                                        item.name,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF723312),
                                          fontFamily: 'PixelifySans',
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
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
