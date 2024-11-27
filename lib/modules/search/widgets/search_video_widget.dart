import 'package:flutter/material.dart';
import 'package:ten_twenty/modules/home/models/home_model.dart';

class WatchVideoWidget extends StatelessWidget {
  final DummyVideoModel videoModel;
  const WatchVideoWidget({
    super.key,
    required this.videoModel,
  });

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
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(.3)),
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  videoModel.name,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              )),
        ),
      ],
    );
  }
}
