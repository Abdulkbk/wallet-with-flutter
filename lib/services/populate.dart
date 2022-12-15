import 'dart:convert';

import 'package:flutter/services.dart';

class Populate {

  static Future<dynamic> loadCards() async {

    try {
      dynamic result = await rootBundle.loadString('assets/data/cards.json');

      result = json.decode(result);

      return result;

    } catch (error) {
      return {'error': error};
    }

  }

  static Future<dynamic> loadCoins() async {

    try{
      dynamic result = await rootBundle.loadString('assets/data/coins.json');

      result = json.decode(result);

      return result;
    } catch (error) {
      return {'error': error};
    }

  }

  static Future<List<Map<String, dynamic>>> loadAActivity() async {

    try {
      dynamic result = await rootBundle.loadString('assets/data/activity.json');

      result = json.decode(result);

      return result;
    } catch (error) {
      return [{'error': error}];
    }
  }
}