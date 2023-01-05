import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class ImageAndFilePickerRepository {
  static final ImagePicker imagePicker = ImagePicker();
  static late PickedFile? imageFile;
  static FilePickerResult? filePickerResult;

  static Future<PickedFile?> pickImagefromCamera() async {
    imageFile = await imagePicker.getImage(
      source: ImageSource.camera,
      imageQuality: 100,
      maxHeight: 400,
      maxWidth: 400,
    );
    return imageFile!;
  }

  static Future<FilePickerResult?> pickFile() async {
    filePickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'png', 'jpeg'],
    );
    return filePickerResult;
  }
}
