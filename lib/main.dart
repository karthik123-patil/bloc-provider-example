import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice/screens/authentication/loginscreen/login.dart';
import 'package:practice/utils/app_colors.dart';
import 'package:practice/screens/article_list_screen.dart';
import 'bloc/article_list_bloc.dart';
import 'bloc/bloc_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w700BitterFont = GoogleFonts.bitter(
      fontWeight: FontWeight.w700,
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: AppColors.black,
        primaryColor: AppColors.black,
        colorScheme: Theme.of(context).colorScheme.copyWith(
          secondary: AppColors.green,
          primary: AppColors.black,
        ),
        scaffoldBackgroundColor: AppColors.grey,
        backgroundColor: AppColors.grey,
        primaryTextTheme: TextTheme(
          headline6: w700BitterFont,
        ),
        textTheme: TextTheme(
          subtitle1: w700BitterFont.apply(color: AppColors.black),
          headline6: w700BitterFont.apply(color: AppColors.black),
          bodyText2: TextStyle(color: AppColors.black),
        ),
      ),
      routes: {
        '/': (context) => const LoginScaffold(),
        '/articleList': (context) =>  BlocProvider<ArticleListBloc>(
          bloc: ArticleListBloc(),
          child: const ArticleListScreen(),
        ),
      },
      initialRoute: '/',
    );
      /*BlocProvider<ArticleListBloc>(
        bloc: ArticleListBloc(),
        child: MaterialApp(
          title: 'Article',
          home: const ArticleListScreen(),
          theme: ThemeData(
            primarySwatch: AppColors.black,
            primaryColor: AppColors.black,
            colorScheme: Theme.of(context).colorScheme.copyWith(
              secondary: AppColors.green,
              primary: AppColors.black,
            ),
            scaffoldBackgroundColor: AppColors.grey,
            backgroundColor: AppColors.grey,
            primaryTextTheme: TextTheme(
              headline6: w700BitterFont,
            ),
            textTheme: TextTheme(
              subtitle1: w700BitterFont.apply(color: AppColors.black),
              headline6: w700BitterFont.apply(color: AppColors.black),
              bodyText2: TextStyle(color: AppColors.black),
            ),
          ),
        ));*/
  }
}
