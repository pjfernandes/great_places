import 'package:flutter/widgets.dart';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return items.length;
  }

  Place itemByIndex(int index) {
    return _items[index];
  }
}
