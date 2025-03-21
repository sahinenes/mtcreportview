import 'dart:io';

import 'package:flutter/material.dart';

import '../../../core/constants/enums/image_enums.dart';



class AvatarCardWidget extends StatelessWidget {
  const AvatarCardWidget({
    super.key,
    required this.image,
    required this.radius,
    required this.type,
  });
  final String image;
  final double radius;
  final ImageTypes type;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        radius: radius,
        child: type == ImageTypes.ASSET
            ? CircleAvatar(backgroundColor: const Color.fromRGBO(245, 245, 245, 1), radius: radius, backgroundImage: AssetImage(image))
            : CircleAvatar(backgroundColor: const Color.fromRGBO(245, 245, 245, 1), radius: radius, backgroundImage: FileImage(File(image))));
  }
}
