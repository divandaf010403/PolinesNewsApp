import 'package:flutter/material.dart';
import 'package:polines_news_app/article.dart';
import 'package:polines_news_app/NewsListPage.dart';
import 'package:polines_news_app/NewsDetailPage.dart';
import 'package:polines_news_app/NewsWebView.dart';
import 'package:polines_news_app/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: primaryColor,
          onPrimary: Colors.black,
          secondary: secondaryColor,
        ),
        appBarTheme: const AppBarTheme(elevation: 0),
        textTheme: myTextTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: secondaryColor,
            onPrimary: Colors.white,
            textStyle: const TextStyle(),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              )
            )
          )
        )
      ),
      initialRoute: NewsListPage.routeName,
      routes: {
        NewsListPage.routeName : (context) => NewsListPage(),
        NewsDetailPage.routeName : (context) => NewsDetailPage(
          article: ModalRoute.of(context)?.settings.arguments as Article,
        ),
        NewsWebView.routeName : (context) => NewsWebView(url: ModalRoute.of(context)?.settings.arguments as String),
      },
    );
  }
}

