import 'package:flutter/material.dart';

class CameraOrGallery extends StatelessWidget {
  final Function (bool captured) pickImage;
  const CameraOrGallery({
    super.key,
    required this.pickImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height*0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: (){
              pickImage(false);
              Navigator.pop(context);
            },
            child: const Column(
              children: [
                Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.black54,
                  size: 70,
                ),
                Text(
                  'Camera',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: (){
              pickImage(true);
              Navigator.pop(context);
            },
            child: const Column(
              children: [
                Icon(
                  Icons.image_outlined,
                  color: Colors.black54,
                  size: 70,
                ),
                Text(
                  'Gallery',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
