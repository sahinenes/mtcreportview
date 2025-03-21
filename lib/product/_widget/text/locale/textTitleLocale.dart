import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';

class MyTextTitleLocaleWidget extends StatelessWidget {
  MyTextTitleLocaleWidget({super.key, required this.text, this.textStyle});
  final String text;
  TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.locale,
      style: textStyle ?? context.textStyleTitle,
    );
  }
}
