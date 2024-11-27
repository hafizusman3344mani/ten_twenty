import 'package:flutter/material.dart';
import 'package:ten_twenty/modules/home/models/home_model.dart';

class SearchVideoWidget extends StatelessWidget {
  final DummyVideoModel videoModel;
  const SearchVideoWidget( {super.key,required this.videoModel,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(videoModel.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(.3)
          ),
        ),
      ],
    );
  }
}
