import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
// import 'package:path_provider/path_provider.dart' as syspaths;
// import 'package:path/path.dart' as path;

class ImageFieldScreen extends StatefulWidget {
  const ImageFieldScreen({super.key});

  @override
  State<ImageFieldScreen> createState() {
    return _ImageFieldScreenState();
  }
}

class Place {
  final File image;

  Place({required this.image});
}

class _ImageFieldScreenState extends State<ImageFieldScreen> {
  // File? _selectedImage;
  final List<File> _selectedImage = [];

  // List<Place> places = [];

  // void addPlace(File image) async {
  //   final imgDir = await syspaths.getApplicationDocumentsDirectory();
  //   final filename = path.basename(image.path);
  //   final copiedImage = await image.copy('${imgDir.path}/$filename');

  //   final newPlace = Place(image: copiedImage);
  //   places.add(newPlace);
  // }

  void _takePicture() async {
    final imagePicker = ImagePicker();
    // imagePicker.pickMultiImage(maxWidth: 600, imageQuality: 1080);
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _selectedImage.add(File(pickedImage.path));
    });
  }

  void _clearImage() {
    setState(() {
      _selectedImage.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: Radius.circular(16),
        strokeWidth: 2,
        dashPattern: [10, 5],
        color: _selectedImage.isEmpty
            ? Colors.grey.shade300
            : Colors.green.shade200,
      ),
      child: Container(
        height: 250,
        width: MediaQuery.sizeOf(context).width,
        alignment: Alignment.center,
        // child: TextButton.icon(
        //   icon: const Icon(Icons.camera_alt_outlined),
        //   label: const Text('Capture images'),
        //   onPressed: _takePicture,
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),

            TextButton.icon(
              icon: Icon(
                _selectedImage.isEmpty
                    ? Icons.camera_alt_outlined
                    : Icons.check_circle,
                size: 30,
                color: _selectedImage.isEmpty ? Colors.grey : Colors.green,
              ),
              onPressed: () {
                _takePicture();
              },
              label: Text(''),
            ),

            Text(
              _selectedImage.length <= 1
                  ? '${_selectedImage.length} Image captured'
                  : '${_selectedImage.length} Images captured',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),

            _selectedImage.isEmpty
                ? TextButton(
                    onPressed: () {
                      _takePicture();
                    },
                    child: Text(
                      'Tap to capture',
                      style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                // : TextButton(
                //     onPressed: () {
                //       _clearImage();
                //     },
                //     child: Text('Clear images'),
                //   ),
                : TextButton.icon(
                    onPressed: () {
                      _clearImage();
                    },
                    icon: Icon(Icons.delete, color: Colors.grey[200]),

                    label: Text(
                      'Clear images',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
