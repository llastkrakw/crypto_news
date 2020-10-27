import 'package:flutter/material.dart';
import 'package:news/constants.dart';
import 'package:news/data/news_api_service.dart';
import 'package:news/screens/home/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => NewsApiService.create(),
      dispose: (_, NewsApiService service) => service.client.dispose(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crypto News',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColorDark: kBgColor1,
          primaryColor: kBgColor1,
          backgroundColor: kBgColor1,
          scaffoldBackgroundColor: kBgColor1
        ),
        home: HomePage(),
      ),
    );
  }
}




