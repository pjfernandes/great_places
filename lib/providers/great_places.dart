import 'package:flutter/widgets.dart';
import 'package:great_places/utils/db_util.dart';
import '../models/place.dart';

import 'dart:io';
import 'dart:math';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  Future<void> loadPlaces() async {
    final dataList = await DbUtil.getData('places');

    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            location: item['location'],
            image: File(item['image']),
          ),
        )
        .toList();
    notifyListeners();
  }

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return items.length;
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: PlaceLocation(latitude: -22, longitude: -43),
    );
    _items.add(newPlace);
    DbUtil.insert(
      'places',
      {'id': newPlace.id, 'title': newPlace.title, 'image': newPlace.image},
    );
    notifyListeners();
  }
}
