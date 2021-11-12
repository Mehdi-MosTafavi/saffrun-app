import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/UI/utils/circular_progressbar_component.dart';
import 'package:saffrun_app/constants/const.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/state_managment/splash/splash_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  void navigationToHomePage() {
    Navigator.pushReplacementNamed(context, ADMIN_PAGE_PATH);
  }

  void navigationToAuthPage() {
    Navigator.pushReplacementNamed(context, ADMIN_PAGE_PATH);
  }

  late bool startApp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startApp = true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: Scaffold(
          body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {

          if (state is SplashGoToLoginPage) {
            navigationToAuthPage();
          }
          if (state is SplashGoToHomePage) {
            navigationToHomePage();
          }
        },
        child: BlocBuilder<SplashCubit, SplashState>(
          builder: (context, state) {
            if (state is SplashInitial && startApp) {
              startApp = false;
              BlocProvider.of<SplashCubit>(context).handlerSplashNavigation();
            }
            return Container(
              height: context.height(),
              width: context.width(),
              // padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(color: colorBackgroundSplash),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: FractionallySizedBox(
                        widthFactor: 0.6,
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  scale: 0.1,
                                  image: AssetImage('assets/images/logo.png'))),
                        ),
                      ),
                    ),
                  ),
                  const CircularProgressBar(),
                ],
              ),
            );
          },
        ),
      )),
    );
  }
}
