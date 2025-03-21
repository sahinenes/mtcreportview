import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/init/language/language_keys.g.dart';
import '../text/textTitle.dart';

void showSnackBar(BuildContext context, String text, Function()? onPressed) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: MyTextTitleWidget(text: text),
      action: SnackBarAction(
        label: LocaleKeys.ok.tr(),
        onPressed: onPressed ?? () {},
      )));
}
