import 'package:flutter/material.dart';

class UploadButton extends StatelessWidget {
  final Function  imageSourceSelector;
  const UploadButton({
    super.key,
    required this.imageSourceSelector,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
            colors: [Color(0xff8459e9),Color(0xff5c9ced)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )
      ),
      child: MaterialButton(
        onPressed: (){
          imageSourceSelector();
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.file_upload_outlined,
              size: 30,
              color: Colors.white,
            ),
            Text(
              'Upload Image',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
