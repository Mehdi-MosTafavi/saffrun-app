import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:saffrun_app/logical/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);

  runApp(
    MyApp(
      router: AppRouter(),
    ), // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final AppRouter router; // Navigation Manager of app

  const MyApp({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget!),
            // maxWidth: 1200,
            minWidth: 450,
            defaultScale: false,
            breakpoints: [
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
            background: Container(color: const Color(0xFFF5F5F5))),
        title: 'Saffrun',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            dividerColor: Colors.transparent,
            highlightColor: Colors.black45,
            fontFamily: 'Dana',
            iconTheme: const IconThemeData(color: Colors.white),
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
                .copyWith(secondary: Colors.black12)),
        onGenerateRoute: router.generateRoute,
        initialRoute: '/', // initial route to Splash screen
      ),
    );
  }
}