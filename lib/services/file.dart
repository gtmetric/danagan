import 'dart:io';
import 'package:path_provider/path_provider.dart';

class TempFile {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/uid.txt');
  }

  Future<File> writeID(String uid) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(uid);
  }

  Future<String> readID() async {
    try {
      final file = await _localFile;

      // Read the file
      String uid = await file.readAsString();

      return uid;
    } catch (e) {
      // If encountering an error, return 0
      return null;
    }
  }
}