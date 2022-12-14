import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermvvm/ViewModel/AuthViewModel/AuthViewModel.dart';
import 'package:fluttermvvm/ViewModel/SharepreferenceViewmodel/SharepreferenceViewModel.dart';
import 'package:provider/provider.dart';

import 'Utils/Routes/Routes.dart';
import 'Utils/Routes/RoutesName.dart';
import 'View/Splashscreen.dart';
import 'ViewModel/HomeViewModel/HomeViewModel.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            // ChangeNotifierProvider(create: (_) => Cartprovider())
            ChangeNotifierProvider(create: (_) => AuthViewModel()),
            ChangeNotifierProvider(create: (_) => HomeViewModel()),
            ChangeNotifierProvider(create: (_)=>SharepreferenceViewModel())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            initialRoute: RoutesName.splash,
            onGenerateRoute: Routes.generateRoute,
          ),
        );
      }
    );
  }
}
