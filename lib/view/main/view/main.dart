import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../machines/model/machines_model.dart';
import '../../statitistics/model/statistics_model.dart';
import 'package:provider/provider.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/init/language/language_keys.g.dart';
import '../../../core/init/language/language_manager.dart';
import '../../../core/init/navigation/navigation_route.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../core/init/notifier/provider_list.dart';
import '../../../core/init/notifier/theme_notifer.dart';
import '../../../product/_variables/other_variables.dart';
import '../../../product/_variables/view_variables.dart';

import '../../machines/view/machines_view.dart';
import '../viewModel/main_view_model.dart';
import '../../statitistics/view/statistics_view.dart';

Future<void> main() async {
  await _init();
  runApp(
    MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: EasyLocalization(
        path: ApplicationConstants.LANG_ASSET_PATH,
        supportedLocales: LanguageManager.instance.supportedLocales,
        startLocale: LanguageManager.instance.enLocale,
        child: const MyApp(),
      ),
    ),
  );
}

Future<void> _init() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(MachinesModelAdapter());
  Hive.registerAdapter(StatisticsModelAdapter());

  await Hive.openBox<MachinesModel>(
    ApplicationConstants.DATABASE_NAME_MACHINES,
  );
  await Hive.openBox<StatisticsModel>(
    ApplicationConstants.DATABASE_NAME_STATISTICS,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<ThemeNotifier>().currentTheme,
      debugShowCheckedModeBanner: ApplicationConstants.TEST_MODE,
      title: ApplicationConstants.APPLICATION_NAME,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      home: NavigationPage(),
    );
  }
}

class NavigationPage extends StatelessWidget {
  NavigationPage({super.key});

  List<String> appBarTitles = [
    'Machines',
    LocaleKeys.bottom_statistics,
    "Export",
    'Profile',
  ];

  List<Widget> body = [
    const MachinesView(),
    const StatisticsView(),
    const Placeholder(),
    const Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BaseView(
        viewModel: mainViewModel,
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, MainViewModel model) {
          return Observer(
            builder: (_) {
              return _scaffold(context, model);
            },
          );
        },
      ),
    );
  }

  Scaffold _scaffold(BuildContext context, MainViewModel model) {
    return Scaffold(
      key: scaffoldKey,

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF2A5BDA),
        shape: const CircleBorder(),
        child: const Icon(Icons.qr_code_scanner, color: Colors.white),
        onPressed: () {
          NavigationService.instance.navigateToPage(
            path: NavigationConstants.HOME,
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: _bottomNavigationBar(context, model),
      body: LoaderOverlay(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: body[model.currenPageIndex],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context, MainViewModel model) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomAppBar(
        height: 60,
        notchMargin: 5,
        padding: EdgeInsets.zero,
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: _bottomNavItem(
                context,
                0,
                Icons.settings_outlined,
                Icons.settings,
                'Machines',
                model,
              ),
            ),

            Expanded(
              child: _bottomNavItem(
                context,
                1,
                Icons.bar_chart_outlined,
                Icons.bar_chart,
                'Statistics',
                model,
              ),
            ),
            Expanded(
              child: _bottomNavItem(
                context,
                2,
                Icons.picture_as_pdf_outlined,
                Icons.picture_as_pdf,
                'Export',
                model,
              ),
            ),
            Expanded(
              child: _bottomNavItem(
                context,
                3,
                Icons.person_outline,
                Icons.person,
                'Profile',
                model,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavItem(
    BuildContext context,
    int index,
    IconData icon,
    IconData activeIcon,
    String label,
    MainViewModel model,
  ) {
    final bool isSelected = model.currenPageIndex == index;
    final Color activeColor =
        index == 1 ? const Color(0xFF2A5BDA) : Colors.black;

    return InkWell(
      onTap: () {
        model.currenPageIndex = index;
        model.changeLoading();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isSelected ? activeIcon : icon,
            color: isSelected ? activeColor : Colors.grey,
            size: 24,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? activeColor : Colors.grey,
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
