import 'package:flutter/material.dart';

import '../../../core/constants/enums/image_enums.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/extension/context_extension.dart';
import '../text/locale/textBodyLocale.dart';
import '../text/textBody.dart';
import '../text/textTitle.dart';
import 'avatar_card.dart';

class LecturesCardWidget extends StatelessWidget {
  const LecturesCardWidget({
    super.key,
    required this.image,
    required this.name,
    this.comment,
    this.mail,
  });

  final String image;
  final String name;
  final String? comment;
  final String? mail;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      width: context.width,
      height: context.height * 0.20,
      child: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            SizedBox(
              height: context.height * 0.02,
            ),
            if (image != "")
              AvatarCardWidget(
                type: ImageTypes.FILE,
                image: image,
                radius: 40,
              ),
            if (image == "")
              AvatarCardWidget(
                type: ImageTypes.ASSET,
                image: ImageConstants.instance.face,
                radius: 40,
              ),
          ],
        ),
        SizedBox(width: context.width * 0.03),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyTextTitleWidget(
                  text: name,
                ),
                const Icon(
                  Icons.more_vert_rounded,
                ),
              ],
            ),
            SizedBox(height: context.height * 0.02),
            MyTextBodyWidget(
              text: comment ?? "",
              textStyle: context.textStyleBody.copyWith(color: const Color.fromRGBO(130, 130, 130, 1)),
            ),
            SizedBox(height: context.height * 0.01),
            MyTextBodyLocaleWidget(
              text: "Contact",
            ),
            SizedBox(height: context.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.mail,
                  color: Color.fromRGBO(130, 130, 130, 1),
                ),
                SizedBox(width: context.width * 0.04),
                MyTextBodyLocaleWidget(
                  text: mail ?? "",
                  textStyle: context.textStyleBody.copyWith(color: const Color.fromRGBO(130, 130, 130, 1)),
                ),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}
