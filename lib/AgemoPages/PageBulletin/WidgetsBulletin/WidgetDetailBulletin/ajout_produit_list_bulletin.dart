import 'package:flutter/material.dart';
import '../../../../models/produit_model.dart';
import 'produit_bulletin_item.dart';


class AjoutProduitListBulletin extends StatelessWidget {
  const AjoutProduitListBulletin(this.produitsList,{super.key});
  final List<ProduitMod> produitsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: ListView.builder(itemCount: produitsList.length,
          itemBuilder: (context, index) => ProduitBulletinItem(produitsList[index])),
    );
  }
}