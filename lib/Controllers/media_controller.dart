import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddMediaController {
  File? media;

  AddMediaController();

  final picker = ImagePicker();

//Image Picker function to get image from gallery
  Future<File> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      media = null;
    }else{
      media = File(pickedFile.path);
    }

    return media!;
  }

//Image Picker function to get image from camera
  Future<File?> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile == null) {
      return null;
    }

    return File(pickedFile.path);
  }
}
