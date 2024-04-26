import 'package:face_search/Screens/upload_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class FaceSearchApp extends StatelessWidget {
  const FaceSearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Face Search',
      home: const UploadImageScreen(),
      builder: EasyLoading.init(),
    );
  }
}
