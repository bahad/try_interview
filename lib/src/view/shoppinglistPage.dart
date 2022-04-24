import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trytiptop/src/constants.dart';

import '../viewmodel/shop_viewmodel.dart';
import '../widgets/list_item.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({Key? key}) : super(key: key);

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  num quantity = 1;

  @override
  void initState() {
    final shopProvider = Provider.of<ShopProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final shopProvider = Provider.of<ShopProvider>(context);
    //print(shopProvider.shopList[0].img);
    return Scaffold(
      appBar: _buildAppBar(),
      bottomSheet: _buildBottomSheet(size),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(6),
                itemCount: shopProvider.shopList.length,
                itemBuilder: ((context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(6),
                      child: ListItem(
                          img: shopProvider.shopList[index].img!,
                          title: shopProvider.shopList[index].text!,
                          price: shopProvider.shopList[index].price!));
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildBottomSheet(Size size) {
    final shopProvider = Provider.of<ShopProvider>(context);
    return Container(
        decoration: BoxDecoration(color: secondaryColor),
        width: size.width,
        height: size.height * 0.13,
        child: Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  maximumSize: Size(size.width / 1.2, 50),
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6))),
              onPressed: () {},
              child: Row(
                children: [
                  Flexible(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                              bottomLeft: Radius.circular(6)),
                          color: primaryColor,
                        ),
                        child: Center(
                            child: Text(
                          'Check Out',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )),
                      )),
                  Flexible(
                      flex: 3,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(6),
                                  bottomRight: Radius.circular(6)),
                              color: Colors.white),
                          child: Center(
                              child: Text(
                            shopProvider.totalPrice.toString() + " IQD",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          )))),
                ],
              )),
        ));
  }

  AppBar _buildAppBar() {
    final shopProvider = Provider.of<ShopProvider>(context);
    return AppBar(
      centerTitle: true,
      title: Text(
        'Market Card',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
            onPressed: () {
              shopProvider.removeAll();
              shopProvider.nullTotalPrice();
            },
            icon: Icon(
              Icons.delete_outline,
              color: Colors.black,
            ))
      ],
    );
  }
}
