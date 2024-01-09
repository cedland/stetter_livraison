import 'package:agemo/AgemoPages/dimensions_pages.dart';
import 'package:flutter/material.dart';

import '../../../../models/produit_model.dart';


class ImageDescriptionProduitsBulletin extends StatelessWidget {
  const ImageDescriptionProduitsBulletin(this.produitimagedescriptionproduitsbulletin,{Key? key}) : super(key: key);
  final ProduitMod produitimagedescriptionproduitsbulletin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              produitimagedescriptionproduitsbulletin.imageProduit,
              width: displayWidth(context),
              height: displayHeight(context) * 0.3,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
