import 'package:agemo/AgemoPages/dimensions_pages.dart';
import 'package:flutter/material.dart';

import '../../../models/produit_model.dart';

class ImageDescriptionProduits extends StatelessWidget {
  const ImageDescriptionProduits(this.produitimagedescriptionproduits,{Key? key}) : super(key: key);
  final ProduitMod produitimagedescriptionproduits;

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
              produitimagedescriptionproduits.imageProduit,
              width: displayWidth(context),
              height: displayHeight(context) * 0.3,
              fit: BoxFit.cover,
            ),
          ),
        ),
        /*Padding(
          padding: const EdgeInsets.only(top: 14.0),
          child: Container(
              padding: const EdgeInsets.all(8),
              width: displayWidth(context),
              height: displayHeight(context) * 0.15,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              child: Text(produitimagedescriptionproduits.description,style: const TextStyle(fontFamily: 'PoppinsLight',fontSize: 11,),)
          ),
        )*/

      ],
    );
  }
}
