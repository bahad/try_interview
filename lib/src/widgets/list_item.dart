import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../viewmodel/shop_viewmodel.dart';

class ListItem extends StatefulWidget {
  final String img;
  final String title;
  final num price;
  const ListItem(
      {Key? key, required this.img, required this.title, required this.price})
      : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  int sayi = 1;
  @override
  void initState() {
    final shopProvider = Provider.of<ShopProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final shopProvider = Provider.of<ShopProvider>(context);
    return Row(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.black54, width: 0.6),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(widget.img))),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title),
            const SizedBox(height: 5),
            Text('(6 pcs x ${sayi.toString()} pack)'),
            const SizedBox(height: 5),
            Text(
              (widget.price * sayi).toString() + " " + "IQD",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            setState(() {
              if (sayi > 1) {
                sayi--;
                shopProvider.calculateTotalPrice(widget.price, -1);
              }
            });
          },
          child: Container(
            height: 40,
            width: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black54, width: 0.7),
                borderRadius: BorderRadius.circular(4)),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Center(
                child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(Icons.minimize)),
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          width: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: primaryColor,
              border: Border.all(color: Colors.black54, width: 0.7),
              borderRadius: BorderRadius.circular(4)),
          child: Center(
              child: Text(
            sayi.toString(),
            style: TextStyle(fontSize: 19),
          )),
        ),
        Container(
          height: 40,
          width: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black54, width: 0.7),
              borderRadius: BorderRadius.circular(4)),
          child: Center(
            child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    sayi++;
                    shopProvider.calculateTotalPrice(widget.price, 1);
                  });
                },
                icon: Icon(Icons.add)),
          ),
        ),
      ],
    );
  }
}
