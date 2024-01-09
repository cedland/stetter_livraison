import 'package:agemo/AgemoPages/PagesProduit/WidgetsProduit/produits_item.dart';
import 'package:flutter/material.dart';
import '../../../models/produit_model.dart';


class ProduitsList extends StatelessWidget {
  const ProduitsList(this.produitsList,{super.key});
  final List<ProduitMod> produitsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: ListView.builder(itemCount: produitsList.length,
            itemBuilder: (context, index) => ProduitsItem(produitsList[index])),
    );
  }
}