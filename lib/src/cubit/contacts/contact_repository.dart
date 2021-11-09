import 'package:flutter/services.dart' show rootBundle;

class ContactRepository{

  Future<String> loadAsset() async{
    return await rootBundle.loadString("assets/data/records.json");
  }

}