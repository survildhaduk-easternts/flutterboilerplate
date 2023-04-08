import 'package:flutter/material.dart';
import 'package:flutterboilerplate/feature/presentation/pages/login/login.dart';
import 'package:flutterboilerplate/provider_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../utils/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: ListProvider.providerList,child: MaterialApp(   debugShowCheckedModeBanner: false,
        title: 'BhagatGroupTaskManagement',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.red,
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenrator.generateRoute,  home: LoginPage(),navigatorKey: MyApp.navigatorKey,),
    );

  }
}
