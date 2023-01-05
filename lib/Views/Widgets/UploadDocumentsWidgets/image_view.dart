import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageView extends StatelessWidget {
  final File imageUrl;
  const ImageView({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: "image",
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            image: DecorationImage(
                image: FileImage(imageUrl),
                alignment: Alignment.centerRight,
                fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
