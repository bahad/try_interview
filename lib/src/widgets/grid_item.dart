import 'package:flutter/material.dart';
import 'package:trytiptop/src/constants.dart';

class GridItem extends StatelessWidget {
  final String img;
  final String lbl;
  final num prc;
  const GridItem(
      {Key? key, required this.img, required this.lbl, required this.prc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                borderRadius: BorderRadius.circular(6)),
            child: Stack(
              children: [
                Image.asset(
                  img,
                ),
                Positioned(
                    bottom: 3,
                    right: 3,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryColor)),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: primaryColor,
                        ),
                      ),
                    ))
              ],
            )),
        const SizedBox(height: 5),
        Text(lbl)
      ],
    );
  }
}
