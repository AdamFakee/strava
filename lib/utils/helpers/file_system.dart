import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

class SFileSystem {
  static Future<File> writeAsBytes(Uint8List data, {
    required String fileName
  }) async {
    final directory = await getApplicationDocumentsDirectory();
    
    final path = "${directory.path}/$fileName";
    final file = File(path);

    return await file.writeAsBytes(data);
  }

}
