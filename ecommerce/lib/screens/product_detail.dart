import 'dart:ui';

import 'package:ecommerce/images/network_images.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with TickerProviderStateMixin {
  late Size screnSize = MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.chevron_left,
              size: 40,
              color: Colors.white,
            )),
        backgroundColor: Colors.purple,
        title: Text("Product Detail", style: TextStyle(color: Colors.white)),
      ),
      body: _buildProductDetails(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  _buildProductDetails() {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .start, // elemanları oluşturmadan önce belirleliyiz !
            children: [
              _buildProductImages(),
              _buildProductTitle(),

              _buildProductPrice(),

              _buildDivider(screnSize),

              //_buildFurtherInfo(),

              //_buildSizeArea(),

              //_buildProductInfo(),
            ],
          ),
        )
      ],
    );
  }

  _buildProductImages() {
    TabController imagesController = TabController(length: 3, vsync: this);
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height * 0.20,
        child: Center(
          child: DefaultTabController(
            length: 3,
            child: Stack(
              children: <Widget>[
                TabBarView(
                  controller: imagesController,
                  children: <Widget>[
                    Image.network(objectUrl),
                    Image.network(objectUrl2),
                    Image.network(objectUrl3)
                  ],
                ),
                Container(
                  alignment: const FractionalOffset(0.5, 0.95),
                  child: TabPageSelector(
                    controller: imagesController,
                    selectedColor: Colors.green,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildProductTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Center(
        child: Text(
          "Apple AirBook 16",
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ),
    );
  }

  _buildProductPrice() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Text(
            "\$100",
            style: TextStyle(fontSize: 16.0, color: Colors.green),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            "\$200",
            style: TextStyle(
                fontSize: 12.0,
                color: Colors.black26,
                decoration: TextDecoration.lineThrough),
          ),
          SizedBox(width: 8.0),
          Text(
            " % 50 indirim",
            style: TextStyle(fontSize: 16.0, color: Colors.black26),
          ),
        ],
      ),
    );
  }

  _buildDivider(Size screenSize) {
    return Column(
      children: [
        Container(color: Colors.red, width: screenSize.width, height: 0.25),
      ],
    );
  }
  /*
  _buildFurtherInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Icon(Icons.local_offer),
          SizedBox(width: 12.0),
          Text(
            "Daha fazla bilgi için tiklayiniz",
            style: TextStyle(fontSize: 16, color: Colors.blueAccent),
          )
        ],
      ),
    );
  }
    */

  /*
  _buildProductInfo() {
    TabController tabController = TabController(
        length: 2,
        vsync:
            this); // vertical syncronization bunu TickerProviderStateMixin ile destekliyoruz
    return Container(
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            tabs: [
              Tab(
                child: Text(
                  "Teknik Özellikler",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  "Açıklama",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              child: TabBarView(
                controller: tabController,
                children: [
                  Text(
                    "Ram 8GB HDD 500 GB Ekran 15.6 ",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "Ürün 2019 model Apple Macbook Air ve 7.Nesildir ",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              )),
        ],
      ),
    );
  }

   */

  _buildBottomNavigationBar() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: RaisedButton(
                onPressed: () {},
                color: Colors.grey,
                child: Row(
                  children: [
                    Icon(
                      Icons.list,
                      color: Colors.white,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      "Önerileriniz",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              fit: FlexFit.tight,
              flex: 1,
            ),
            Flexible(
              child: RaisedButton(
                onPressed: () {},
                color: Colors.greenAccent,
                child: Row(
                  children: [
                    Icon(
                      Icons.card_travel,
                      color: Colors.white,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      "Ürünü Sipariş Et",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              fit: FlexFit.tight,
              flex: 1,
            ),
          ],
        ));
  }
}
