import 'package:flutter/material.dart';

import '../../../core/constants/enums/image_enums.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/language/language_keys.g.dart';
import '../text/locale/textBodyLocale.dart';
import '../text/textBody.dart';
import '../text/textTitle.dart';
import 'avatar_card.dart';

class LessonCardWidget extends StatelessWidget {
  const LessonCardWidget(
      {super.key, required this.name, required this.location, required this.startTime, required this.endTime, required this.imagePath});
  final String name;
  final String location;
  final String startTime;
  final String endTime;
  final List<String> imagePath;

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
      height: context.height * 0.18,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _hours(context),
          SizedBox(
            width: context.width * 0.01,
          ),
          _titles(context)
        ],
      ),
    );
  }

  Expanded _titles(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        alignment: Alignment.topLeft,
        padding: context.paddingLow,
        color: context.theme.colorScheme.surface,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
          MyTextTitleWidget(
            text: name,
          ),
          SizedBox(height: context.height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyTextBodyLocaleWidget(
                text: LocaleKeys.add_timeline_location,
                textStyle: context.textStyleBody.copyWith(color: const Color.fromRGBO(130, 130, 130, 1)),
              ),
              MyTextBodyLocaleWidget(
                text: "Lectures",
                textStyle: context.textStyleBody.copyWith(color: const Color.fromRGBO(130, 130, 130, 1)),
              ),
            ],
          ),
          SizedBox(height: context.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.pin_drop_outlined,
                    size: 18,
                    color: Color.fromRGBO(130, 130, 130, 1),
                  ),
                  SizedBox(width: context.width * 0.01),
                  MyTextBodyWidget(
                    text: location == "" ? "not found" : location,
                    textStyle: context.textStyleBody.copyWith(color: const Color.fromRGBO(130, 130, 130, 1)),
                  ),
                ],
              ),
              if (imagePath.isEmpty)
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: context.width * 0.02),
                      child: AvatarCardWidget(
                        type: ImageTypes.ASSET,
                        image: ImageConstants.instance.woman,
                        radius: 16,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: context.width * 0.02),
                      child: AvatarCardWidget(
                        type: ImageTypes.ASSET,
                        image: ImageConstants.instance.men,
                        radius: 16,
                      ),
                    )
                  ],
                ),
              if (imagePath.isNotEmpty)
                SizedBox(
                  height: context.height * 0.05,
                  width: context.width * 0.09 * imagePath.length,
                  child: Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: imagePath.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: context.width * 0.02),
                          child: Semantics(
                            child: AvatarCardWidget(
                              type: ImageTypes.FILE,
                              image: imagePath[index],
                              radius: 16,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
            ],
          )
        ]),
      ),
    );
  }

  Container _hours(BuildContext context) {
    return Container(
      height: context.height * 0.22,
      width: context.width * 0.22,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          context.theme.colorScheme.secondary,
          context.theme.colorScheme.secondary.withOpacity(0.8),
        ]),
        // color: ColorManager.instance.colorScheme.secondary,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
      ),
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
        MyTextTitleWidget(
          text: startTime,
          textStyle: context.textStyleTitle.copyWith(color: context.theme.colorScheme.surface),
        ),
        MyTextTitleWidget(
          text: endTime,
          textStyle: context.textStyleTitle.copyWith(color: context.theme.colorScheme.surface),
        )
      ]),
    );
  }
}
