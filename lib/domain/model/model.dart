class EggTimer {
  final List<Item> _items;

EggTimer({required List<Item> items}) : _items = items;

  List<Item> get items => _items;
}


class Item {
  final String name;
  final String imagePath;
  final Duration timerDone;

  Item({
    required this.name,
    required this.imagePath,
    required this.timerDone
  });
}