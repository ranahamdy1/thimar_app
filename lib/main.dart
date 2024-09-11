import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/features/kiwi.dart';
import 'package:thimar_app/views/auth/login_screen.dart';

import 'features/pages/categories/cubit/categories_cubit.dart';
import 'features/pages/slider/cubit/slider_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  initKiwi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>SliderCubit()..getData()),
        BlocProvider(create: (BuildContext context)=>CategoriesCubit()..getCategories()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context,child)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff4C8613)),
          filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
              fixedSize: Size.fromHeight(60.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r)
              )
            )
          ),
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r)
              )
          ),
        ),
        //arabic app
        builder: (context,child)=> Directionality(textDirection: TextDirection.rtl, child: child!),
        home: child,
      ),
        child: const LoginScreen(),
      ),
    );
  }
}
