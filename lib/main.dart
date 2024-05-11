import 'package:flutter/material.dart';

import 'Acitivity/home.dart';
import 'Acitivity/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/" : (context) => Loading(),
      "/home" : (context) => Home(),
      "/loading" : (context) => Loading(),
    },
  ));
}

