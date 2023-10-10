import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

Future<String> Uploadfirebase(String doc) async {
  try {
    Reference referenceimagetoupload = FirebaseStorage.instance
        .ref()
        .child('images')
        .child('userid')
        .child(doc);
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    PlatformFile file = result!.files.first;
    Uint8List bytes = file.bytes!;
    String fileName = file.name;
    referenceimagetoupload.putData(bytes);
    return fileName;
  } catch (e) {
    print(e);
  }
  return "";
}
