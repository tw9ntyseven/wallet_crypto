import 'package:flutter/material.dart';
import 'package:wallet_fltr/screens/app.dart';
import 'dart:core';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    initialRoute: '/',
    routes: {
      '/': (context) => App(),
    },
  ));
}
