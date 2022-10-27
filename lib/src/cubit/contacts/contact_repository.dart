// This repository file is responsible for all data fetching
// Like api calls, reading from file, database, firebase

import 'dart:convert';
import 'package:contact_app/src/helpers/file_helper.dart';
import 'package:contact_app/src/models/record.dart';

class ContactRepository {

  Future<List<Record>> getRecordsData() async {
    const String recordsAssetPath = "assets/data/records.json";
    String recordsJSONData =
        await FileHelper.readJSONFile(recordsAssetPath); // JSON Array Data
    List<dynamic> decodedData = jsonDecode(recordsJSONData); // Step 3
    List<Record> records =
        decodedData.map<Record>((e) => Record.fromJSON(e)).toList(); // Step 4
    return records;
  }

}
