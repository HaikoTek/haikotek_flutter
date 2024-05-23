import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haikotek_flutter/utils/app_extension.dart';
import 'package:haikotek_flutter/app/app_route.dart';
import 'package:haikotek_flutter/services/providers/providers.dart';


Future<void> bootstrap() async {
  /// Start services later
  WidgetsFlutterBinding.ensureInitialized();

  /// Force portrait mode
  await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp]);

/// Init Db
  await databaseProvider('q_flutter.realm');

  /// Run Application
  runApp(

    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  late bool hasCredential;

  @override
  void initState() {
    super.initState();

    /// Init page route
    () async {
      hasCredential = await ref.read(pCredentialProvider).loadCredential();
      if(hasCredential) {
        ref.navigator()?.pushReplacementNamed(AppRoute.routeHome);
      } 
    }();
  }

    // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Q.',
  //     theme: ThemeData(
  //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
  //       useMaterial3: true,
  //     )
  //   );
  // }

   @override
  Widget build(BuildContext context) {
    /// Get providers
    final AppRoute appRoute = AppRoute.I;

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) => MaterialApp(
        navigatorKey: appRoute.navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        //https://stackoverflow.com/questions/57245175/flutter-dynamic-initial-route
        //https://github.com/flutter/flutter/issues/12454
        // home: (appRoute.generateRoute(const RouteSettings(name: AppRoute.routeRoot)) as MaterialPageRoute<dynamic>)
        //     .builder(context),
        initialRoute: (hasCredential) ? AppRoute.routeHome : AppRoute.routeSignIn,
        onGenerateRoute: appRoute.generateRoute,
        navigatorObservers: <NavigatorObserver>[appRoute.routeObserver],
      ),
    );
  }
}