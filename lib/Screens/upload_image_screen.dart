import 'package:face_search/Screens/result_images_screen.dart';
import 'package:face_search/Widgets/common_appbar.dart';
import 'package:face_search/Widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import '../Widgets/camera_or_gallery_selection_area.dart';
import '../Widgets/upload_image_button.dart';
import '../Widgets/uploaded_image_view.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});
  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  XFile? _pickedImage;
  bool _imagePicked=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 32),
          child: Column(
            children: [
              ImageView(imagePicked: _imagePicked, pickedImage: _pickedImage),
              const SizedBox(height: 15,),
              const GradientText(
                colors: [Color(0xff8a5ef7),Color(0xff65a5fb)],
                size: 35,
                text: 'Find That Dude                  ',
              ),
              const Text(
                "Figure out someone's entire internet presence,from just a photo",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 30,),
              UploadButton(imageSourceSelector: imageSourceSelector,),
            ],
          ),
        ),
      ),
    );
  }

  imageSourceSelector(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const GradientText(
          colors: [Color(0xff8a5ef7),Color(0xff65a5fb)],
          size: 30,
          text: 'Select Image Source',
        ),
        content: CameraOrGallery(pickImage: pickImage,),
      );
    });
  }

  Future<void> pickImage(bool captured) async{
    ImagePicker picker=ImagePicker();
    _pickedImage=await picker.pickImage(source: captured?ImageSource.gallery:ImageSource.camera).whenComplete((){
      _imagePicked=true;
      setState(() {});
      uploadImage();
    });

  }

  uploadImage()async{
    EasyLoading.show(status: 'Uploading & Processing Image');
    Future.delayed(const Duration(seconds: 3)).then((value){
      EasyLoading.dismiss();
      Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultImagesScreen(pickedImage: _pickedImage!.path,)));
    });
  }
}



