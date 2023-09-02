import 'package:flutter/material.dart';
import 'package:megabank/constants.dart';
import 'package:megabank/models/provider/page_index_provider.dart';
import 'package:megabank/routes/app_route_config.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageIndex()),
      ],
      child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        title: 'MegaBank',
        debugShowCheckedModeBanner: false,
        routeInformationParser:
            NyAppRouter.returnRouter(false).routeInformationParser,
        routerDelegate: NyAppRouter.returnRouter(false).routerDelegate,
        theme: ThemeData(
          primarySwatch: Palette.themeColor,
        ),
      );
    });
  }
}
