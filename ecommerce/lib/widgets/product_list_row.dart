import 'package:ecommerce/utilities/constants.dart';
import 'package:flutter/material.dart';

class ProductListRow extends StatelessWidget {
  String name;
  int currentPrice;
  int originalPrice;
  int discount;
  String imageUrl;
  ProductListRow(
      //verileri almak için yapıcı method'a ihtiyaç duyuluyor
      {required this.name,
      required this.currentPrice,
      required this.originalPrice,
      required this.discount,
      required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildProductItemCard(context),
        _buildProductItemCard(context),
      ],
    );
  }

  _buildProductItemCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Constants.ROUTE_PRODUCT_DETAIL);
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.46,
              child: Image.network(this.imageUrl),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Column(
                children: <Widget>[
                  Text(this.name,
                      style: TextStyle(fontSize: 16.0, color: Colors.black)),
                  SizedBox(height: 2.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .start, // elemanları yan yana gelecek şekilde baştan dizmeye yarar
                    children: [
                      Text("$currentPrice\$",
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                      SizedBox(width: 8),
                      Text("$originalPrice\$",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough)),
                      SizedBox(width: 8),
                      Text(
                        "$discount % indirim",
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
