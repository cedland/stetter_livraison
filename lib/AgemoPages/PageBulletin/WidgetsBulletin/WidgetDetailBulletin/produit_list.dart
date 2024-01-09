import 'package:agemo/AgemoPages/PageBulletin/WidgetsBulletin/WidgetDetailBulletin/produit_item_detail_bulletin.dart';
import 'package:flutter/material.dart';
import '../../../../../models/produit_model.dart';


class ProduitList extends StatelessWidget {
  ProduitList(this.produitMod,{super.key});
  final ProduitMod produitMod;

  // Recuperation de la Liste des jeux a partir du model
  final List<ProduitMod> produits = ProduitMod.produits();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: produits.length,
          itemBuilder: (context, index) {
            return ProduitsItemDetailBulletin(produitMod);
          }),
    );

  }
}
