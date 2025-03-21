// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mtcreportview/core/extension/context_extension.dart';

import '../../../core/constants/image/image_constants.dart';
import '../../../core/init/language/language_keys.g.dart';
import '../../_widget/text/textBody.dart';

class NotFoundPage extends StatelessWidget {
  NotFoundPage({super.key, required this.onPressed});
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: SvgPicture.asset(
              ImageConstants.instance.notFound,
              semanticsLabel: 'not found',
              placeholderBuilder: (context) {
                return Center(child: SizedBox(width: context.width, child: const CircularProgressIndicator()));
              },
            ),
          ),
          Expanded(
              child: Column(
            children: [
              IconButton(
                icon: const Icon(Icons.replay),
                onPressed: onPressed,
              ),
              MyTextBodyWidget(text: LocaleKeys.page_not_found)
            ],
          ))
        ],
      ),
    );
  }
}
