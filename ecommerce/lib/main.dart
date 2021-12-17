import 'package:ecommerce/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'screens/productlist.dart';

void main() => runApp(const Ecommerce());

class Ecommerce extends StatelessWidget {
  const Ecommerce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      home: ProductList(),
      routes: Routes.routes,
    );
  }
}
