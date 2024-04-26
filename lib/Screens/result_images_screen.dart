import 'dart:async';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:face_search/Widgets/gradient_text.dart';
import 'package:face_search/dummy_api_caller.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../Widgets/common_appbar.dart';

class ResultImagesScreen extends StatefulWidget {
  const ResultImagesScreen({super.key, required this.pickedImage});
  final String pickedImage;
  @override
  State<ResultImagesScreen> createState() => _ResultImagesScreenState();
}

class _ResultImagesScreenState extends State<ResultImagesScreen> {
  List<String> images = [' '];
  int imagesCount=1;
  @override
  void initState() {
    super.initState();
    saveFetchedImages();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GradientText(
              colors: [Color(0xff8a5ef7), Color(0xff65a5fb)],
              size: 35,
              text: 'Results:',
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 2
                        : 4,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30
                ),
                itemCount: imagesCount>=(images.length+1)?imagesCount:imagesCount+1,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: index > 0
                        ? index!=imagesCount
                        ?CachedNetworkImage(
                            imageUrl:
                                images[index-1],
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        :Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white.withOpacity(0.5),
                          child: Container(
                                                color: Colors.grey,
                                              ),
                        )
                        : Image.file(
                            File(widget.pickedImage),
                            fit: BoxFit.cover,
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveFetchedImages() async{
    images=await DummyAPICaller.fetchImages().whenComplete(() => startTimer());
  }

  startTimer(){
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if(imagesCount<=images.length){
        imagesCount++;
        setState(() {});
      }else{
        timer.cancel();
      }
    });
  }
}
