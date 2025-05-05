import 'package:te/domain/model/model.dart';

class ItemRepo {
  final EggTimer _eggTimer = EggTimer(
    items: [
      Item(
        name: 'Bolied egg',
        imagePath: 'asset/image/egg.png',
        timerDone: Duration(seconds: 9),
      ),
      Item(
        name: 'Egs Benedict',
        imagePath: 'asset/image/smm.png',
        timerDone: Duration(minutes: 4),
      ),
      Item(
        name: 'Scramble',
        imagePath: 'asset/image/sc.png',
        timerDone: Duration(minutes: 2),
      ),
      Item(
        name: 'Toast',
        imagePath: 'asset/image/toast.png',
        timerDone: Duration(minutes: 2),
      ),
    ],
  );

  EggTimer get eggTimer => _eggTimer;
}
