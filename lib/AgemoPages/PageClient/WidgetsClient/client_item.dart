import 'package:agemo/AgemoPages/PageClient/WidgetsClient/commande_client.dart';
import 'package:flutter/material.dart';

import '../../../../models/client_model.dart';
import 'profil_client.dart';



class ClientItem extends StatefulWidget {
  const ClientItem(this.clientMod, {Key? key}) : super(key: key);
  final ClientMod clientMod;

  @override
  State<ClientItem> createState() => _ClientItemState();
}

class _ClientItemState extends State<ClientItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProfilClient(widget.clientMod),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15,left: 7, right: 7),
        width: MediaQuery.of(context).size.width,
        height: 107,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(color: widget.clientMod.actif
                          ? Colors.green
                          : const Color.fromARGB(255, 229, 36, 36),),
                      child: Text(
                        '${widget.clientMod.codeClient.toString()} ',
                        style:TextStyle(fontSize: 14, fontFamily: 'LatoBold',color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '${widget.clientMod.nomClient} ',
                      style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 10,),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CommandeClient(widget.clientMod.nomClient),
                      ),
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      size: 30,
                      color: const Color.fromARGB(255, 229, 36, 36),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '${widget.clientMod.adresseClient} ',
                      style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                    ),
                  ),
                ),
                const SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(left: 14,right: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '${widget.clientMod.npnClient.toString()} ',
                          style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                        ),
                      ),
                      const Spacer(),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '${widget.clientMod.localiteClient} ',
                          style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
