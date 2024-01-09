import 'package:flutter/material.dart';
import '../../../../models/bulletin_model.dart';
import '../../../../models/client_model.dart';
import '../../../../models/produit_model.dart';
import 'update_bulletin_item.dart';


class UpdateBulletinsList extends StatelessWidget {
  const UpdateBulletinsList(this.bulletins, this.produits ,this.clients, {Key? key}) : super(key: key);

  final List<BulletinMod> bulletins;
  final List<ProduitMod> produits;
  final List<ClientMod> clients;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: bulletins.length,
        itemBuilder: (context, index) => UpdateBulletinItem(bulletins[index], produits[index], clients[index]));
  }
}