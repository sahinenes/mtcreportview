import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../../../core/extension/string_extension.dart';


class MyTextDropDownWidget extends StatelessWidget {
  MyTextDropDownWidget({super.key, required this.text, this.textStyle});
  final String text;
  TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width - 70,
      child: Text(
        text.locale,
        style: textStyle ?? context.textStyleTitle,
      ),
    );
  }
}
