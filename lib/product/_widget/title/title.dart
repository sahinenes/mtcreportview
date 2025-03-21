import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../text/locale/textTitleLocale.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  double? heightFactor;

  TitleWidget({super.key, required this.title, this.heightFactor});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.01),
      child: Align(
        heightFactor: 2,
        alignment: Alignment.topLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            MyTextTitleLocaleWidget(
              text: title,
              textStyle: context.textStyleTitle.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
