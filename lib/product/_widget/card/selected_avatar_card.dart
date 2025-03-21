import 'dart:io';

import 'package:flutter/material.dart';

import '../../../core/constants/enums/image_enums.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/extension/context_extension.dart';

class SelectedAvatarCardWidget extends StatelessWidget {
  const SelectedAvatarCardWidget({super.key, required this.image, required this.radius, required this.type, required this.selected});
  final String image;
  final double radius;
  final ImageTypes type;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        border: Border.all(
          width: 4,
          color: selected ? context.theme.colorScheme.secondary : context.theme.colorScheme.surface,
          style: BorderStyle.solid,
        ),
      ),
      child: CircleAvatar(
          backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
          radius: radius,
          child: image != ""
              ? type == ImageTypes.ASSET
                  ? CircleAvatar(backgroundColor: const Color.fromRGBO(245, 245, 245, 1), radius: radius, backgroundImage: AssetImage(image))
                  : CircleAvatar(backgroundColor: const Color.fromRGBO(245, 245, 245, 1), radius: radius, backgroundImage: FileImage(File(image)))
              : CircleAvatar(
                  backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
                  radius: radius,
                  backgroundImage: AssetImage(ImageConstants.instance.face))),
    );
  }
}
