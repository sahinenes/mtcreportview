import 'package:flutter/material.dart';

import '../../../core/constants/image/image_constants.dart';
import '../../../core/extension/context_extension.dart';
import '../text/locale/textBodyLocale.dart';

class EmmptyCardWidget extends StatelessWidget {
  const EmmptyCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            ImageConstants.instance.files,
            width: context.width,
            height: context.height * 0.13,
          ),
          MyTextBodyLocaleWidget(
            text: "List is emty",
            textStyle: context.textStyleBody.copyWith(color: const Color.fromRGBO(130, 130, 130, 1)),
          )
        ],
      ),
    );
  }
}
