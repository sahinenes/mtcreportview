
import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';



class MyTextBodyLocaleWidget extends StatelessWidget {
  MyTextBodyLocaleWidget({super.key, required this.text, this.textStyle,this.textAlign});
  final String text;
  TextStyle? textStyle;
  TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text.locale,
      textAlign: textAlign?? TextAlign.start,
      style: textStyle ?? context.textStyleBody
    );
  }
}
