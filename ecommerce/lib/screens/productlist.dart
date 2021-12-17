import 'package:ecommerce/images/network_images.dart';
import 'package:ecommerce/widgets/product_list_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: _buildProductListPage(),
    );
  }

  _buildProductListPage() {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, int index) {
            if (index == 0) {
              return _buildFilterWidgets(screenSize);
            } else if (index == 4) {
              return SizedBox(height: 12.0);
            } else {
              return _buildProductListRow();
            }
          }),
    );
  }

  _buildFilterWidgets(Size screenSize) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      margin: const EdgeInsets.all(12.0),
      width: screenSize.width,
      child: Card(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildFilterButton("Sirala"),
              Container(
                color: Colors.black,
                width: 2.0,
                height: 24.0,
              ),
              _buildFilterButton("Filtrele"),
            ],
          ),
        ),
      ),
    );
  }

  _buildFilterButton(String title) {
    return InkWell(
      onTap: () {
        showDialog(
          // burada context içerisinde operasyonel olarak Alertdialog'u oluşturduk ve sonrasında ekranda bizden istenilen başlıgı uyarı olarak vermesini istedik

          context: context,
          builder: (_) => AlertDialog(
            title: Text("Ürünleri " + title + "di"),
          ),
        );
      },
      child: Row(
        children: [
          const Icon(Icons.arrow_drop_down, color: Colors.black),
          const SizedBox(width: 2.0),
          Text(title),
        ],
      ),
    );
  }

  _buildProductListRow() {
    return ProductListRow(
      name: "Apple MacBook Air 13",
      currentPrice: 15000,
      originalPrice: 300,
      discount: 50,
      imageUrl:
          productImageUrl, // Images Altındaki Image network icerisinden ürün resmini çekiyor
    );
  }
}
