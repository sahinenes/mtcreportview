import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

class MyTextBodyWidget extends StatelessWidget {
  MyTextBodyWidget({super.key, required this.text, this.textStyle, this.textAlign});
  final String text;
  TextStyle? textStyle;
  TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: textStyle ?? context.textStyleBody,
    );
  }
}
