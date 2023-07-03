import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zodiac_identifier/app/core/dio/custom_dio.dart';
import 'package:zodiac_identifier/app/core/ui/styles/colors_app.dart';
import 'package:zodiac_identifier/app/repositories/constellation_repository.dart';
import 'package:zodiac_identifier/app/repositories/constellation_repository_impl.dart';
import 'package:zodiac_identifier/app/screens/home/home.dart';
import 'package:zodiac_identifier/app/screens/home/home_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CustomDio(),),

        Provider<ConstellationRepository>(create: (context) => ConstellationRepositoryImpl(dio: context.read()),),
        
        Provider(create: (context) => HomeController(context.read(),),)
      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: context.colors.primary,
    
          appBarTheme: AppBarTheme(
            backgroundColor: context.colors.secundary,
            toolbarHeight: 95,
          ),
    
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(context.colors.secundary),
              minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
            )
          ),
    
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}
