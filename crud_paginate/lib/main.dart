import 'package:crud_paginate/view/paginate_view.dart';
import 'package:crud_paginate/view_model/api_crud_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiCrudProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => HomePage(),
          PaginateView.routeName: (context) => PaginateView()
        },
      ),
    );
  }
}
