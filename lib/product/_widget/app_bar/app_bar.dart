import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:mtcreportview/core/extension/string_extension.dart';

PreferredSizeWidget appBar(
  BuildContext context,
  String title,
  int state,
  AdvancedDrawerController controller,
) {
  return AppBar(
    centerTitle: true,

    title: Text(title.locale),
    leading: IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {
        controller.showDrawer();
      },
    ),
    /*actions: <Widget>[
      if (state == 0)
        Padding(
          padding: const EdgeInsets.only(
            right: 16,
            left: 24,
          ),
          child: AvatarCardWidget(
            type: ImageTypes.ASSET,
            radius: context.width / 19,
            image: ImageConstants.instance.face,
          ),
        ),
      if (state == 1)
        IconButton(
            onPressed: () {
              NavigationService.instance.navigateToPage(path: NavigationConstants.ADD_TASK);
            },
            icon: const Icon(Icons.add)),
      if (state == 2) IconButton(onPressed: () async => await _addFunction(context), icon: const Icon(Icons.add)),
      if (state == 3)
        IconButton(
            onPressed: () {
              mainViewModel.changeShowList();
            },
            icon: mainViewModel.showList ? const Icon(Icons.calendar_month) : const Icon(Icons.list)),
      if (state == 4)
        TextButton(
            onPressed: () {
              NavigationService.instance.navigateToPage(path: NavigationConstants.EDIT_PROFILE);
            },
            child: MyTextTitleWidget(
              text: "EDIT",
              textStyle: context.textStyleTitle.copyWith(
                fontWeight: FontWeight.w600,
                color: context.theme.colorScheme.secondary,
              ),
            )),
    ],*/
  );
}

/*
Future<void> _addFunction(BuildContext context) async {
  if (addViewModel.name != "" && addViewModel.startTime != "" && addViewModel.endTime != "" && addViewModel.day != "") {
    for (int i = 0; i < addViewModel.lecturers.length; i++) {
      print(addViewModel.selectedLecturerList[i]);
      if (addViewModel.selectedLecturerList[i] == true) {
        print(addViewModel.lecturers[i].imagePath);
        addViewModel.imageFileList.add(addViewModel.lecturers[i].imagePath ?? "");
      }
    }
    AddModel addModel = AddModel(
        name: addViewModel.name,
        location: addViewModel.location,
        startTime: addViewModel.startTime,
        endTime: addViewModel.endTime,
        day: days[addViewModel.dayIndex],
        lecturerImagePath: addViewModel.imageFileList);

    mainViewModel.changeLoading();

    await addViewModel.add(addModel).then((value) {
      if (value == 1) {
        showSnackBar(context, "succesfull", null);
        addViewModel.name = "";
        addViewModel.location = "";
        addViewModel.startTime = "";
        addViewModel.endTime = "";
        addViewModel.day = days[0];
        addViewModel.imageFileList = [];
        name.clear();
        location.clear();
        comment.clear();
        mail.clear();
      } else {
        showSnackBar(context, "error", null);
      }
    });

    mainViewModel.changeLoading();
  } else {
    showSnackBar(context, "empty values", null);
  }
}*/
