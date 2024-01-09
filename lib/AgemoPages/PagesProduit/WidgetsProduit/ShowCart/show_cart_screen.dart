import 'package:agemo/AgemoPages/PagesProduit/WidgetsProduit/ShowCart/show_cart_list.dart';
import 'package:agemo/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

import '../../../couleurs.dart';


class ShowCartScreen extends StatelessWidget {
  const ShowCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: Colors.grey.shade50,
            appBar: AppBar(
              title: const Text('Panier',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'LatoBold',
                    color: Colors.white
                ),),
              centerTitle: true,
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 229, 36, 36),
              actions: <Widget>[
                badges.Badge(
                  position: badges.BadgePosition.topEnd(top: -1, end: 12),
                  onTap: null,
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: greyColor,
                    padding: const EdgeInsets.all(5),
                    // borderRadius: BorderRadius.circular(4),
                  ),
                  badgeContent: Text(value.shopItems.length.toString(), style: const TextStyle(
                      fontSize: 10, fontFamily: 'PoppinsBold'),),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 13, bottom: 17, right: 18),
                    child: Icon(
                      Icons.shopping_cart,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
            body: const SingleChildScrollView(child: ShowCartList()),
          );
        }
    );
  }
}
