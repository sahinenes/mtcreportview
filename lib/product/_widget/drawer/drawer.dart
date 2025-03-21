import 'package:flutter/material.dart';

import '../../../core/constants/image/image_constants.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../text/textBody.dart';
import '../text/textTitle.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        // Important: Remove any padding from the ListView.
        mainAxisSize: MainAxisSize.max,
        children: [
          DrawerHeader(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: context.theme.colorScheme.surface,
                  radius: context.width * 0.07,
                  child: CircleAvatar(
                    backgroundColor: context.theme.colorScheme.surface,
                    radius: context.width * 0.07,
                    backgroundImage: AssetImage(ImageConstants.instance.woman),
                  ),
                ),
                SizedBox(width: context.width * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextTitleWidget(
                      text: "Enes ŞAHİN",
                      textStyle: context.textStyleTitle.copyWith(
                        fontSize: 20,
                        color: context.theme.colorScheme.surface,
                      ),
                    ),
                    MyTextBodyWidget(
                      text: "example@hotmail.com",
                      textStyle: context.textStyleBody.copyWith(
                        fontSize: 15,
                        color: context.theme.colorScheme.surface,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _listTile(context, "Machines", () {
            NavigationService.instance.navigateToPage(
              path: NavigationConstants.MACHINES,
            );
          }),
          _listTile(context, "Statistics", () {
            NavigationService.instance.navigateToPage(
              path: NavigationConstants.STATISTICS,
            );
          }),
        ],
      ),
    );
  }
}

ListTile _listTile(BuildContext context, String text, Function()? onTap) {
  return ListTile(
    shape: RoundedRectangleBorder(
      side: BorderSide(width: 0, color: context.theme.colorScheme.secondary),
      borderRadius: BorderRadius.zero,
    ),
    tileColor: context.theme.colorScheme.secondary,
    title: MyTextTitleWidget(
      text: text,
      textStyle: context.textStyleTitle.copyWith(
        color: context.theme.colorScheme.surface,
        fontSize: 25,
      ),
    ),
    onTap: onTap,
  );
}
