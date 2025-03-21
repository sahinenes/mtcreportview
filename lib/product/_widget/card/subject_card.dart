import 'package:flutter/material.dart';

import '../../../core/constants/enums/image_enums.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/extension/context_extension.dart';
import '../text/locale/textBodyLocale.dart';
import '../text/textBody.dart';
import '../text/textTitle.dart';
import 'avatar_card.dart';

class SubjectCardWidget extends StatelessWidget {
  const SubjectCardWidget({
    super.key,
    required this.name,
    this.comment,
    required this.images,
    required this.color,
  });

  final String name;
  final String? comment;
  final List<String> images;
  final Color color;

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
      height: context.height * 0.22,
      child: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: 7,
            height: context.height * 0.22,
            decoration:
                BoxDecoration(color: color, borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)))),
        SizedBox(width: context.width * 0.04),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(height: context.height * 0.02),
            MyTextTitleWidget(
              text: name,
            ),
            Expanded(
              child: MyTextBodyWidget(
                text: comment ?? "",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MyTextBodyLocaleWidget(
                      text: "Lecturers",
                      textStyle: context.textStyleBody.copyWith(color: const Color.fromRGBO(130, 130, 130, 1)),
                    ),
                    if (images.isEmpty)
                      SizedBox(
                        height: context.height * 0.07,
                        width: context.width * 0.19,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: context.width * 0.02),
                              child: AvatarCardWidget(image: ImageConstants.instance.woman, radius: 16, type: ImageTypes.ASSET),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: context.width * 0.02),
                              child: AvatarCardWidget(image: ImageConstants.instance.men, radius: 16, type: ImageTypes.ASSET),
                            )
                          ],
                        ),
                      ),
                    if (images.isNotEmpty)
                      SizedBox(
                        height: context.height * 0.05,
                        width: context.width * 0.09 * images.length,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: images.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: context.width * 0.02),
                              child: Semantics(
                                child: AvatarCardWidget(
                                  type: ImageTypes.FILE,
                                  image: images[index],
                                  radius: 16,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    /*ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount:,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: AvatarCardWidget(
                              type: ImageTypes.FILE,
                              radius: 15,
                              image: images[index],
                            ),
                          );
                        })),*/
                  ],
                ),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}
