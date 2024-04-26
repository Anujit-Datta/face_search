import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageView extends StatelessWidget {
  const ImageView({
    super.key,
    required bool imagePicked,
    required XFile? pickedImage,
  }) : _imagePicked = imagePicked, _pickedImage = pickedImage;

  final bool _imagePicked;
  final XFile? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(
          height: 250,
          width: 250,
          image: AssetImage(
            'assets/ai_face.png',
          ),
        ),
        Visibility(
          visible: _imagePicked,
          child: Positioned(
            top: 30,
            left: 30,
            child: CircleAvatar(
              radius: 95,
              //backgroundColor: Colors.white,
              foregroundImage: FileImage(
                File(_pickedImage?.path??''),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
