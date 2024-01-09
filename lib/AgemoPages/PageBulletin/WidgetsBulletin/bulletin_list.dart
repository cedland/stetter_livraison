import 'package:agemo/AgemoPages/PageBulletin/WidgetsBulletin/bulletin_item.dart';
import 'package:flutter/material.dart';
import '../../../models/bulletin_model.dart';
import '../../../models/client_model.dart';
import '../../../models/produit_model.dart';

class BulletinsList extends StatelessWidget {
  const BulletinsList(this.bulletins, this.produits, this.clients, {Key? key})
      : super(key: key);

  final List<BulletinMod> bulletins;
  final List<ProduitMod> produits;
  final List<ClientMod> clients;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: ListView.builder(
          itemCount: bulletins.length,
          itemBuilder: (context, index) =>
              BulletinItem(bulletins[index], produits[index], clients[index])),
    );
  }
}
