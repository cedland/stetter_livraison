import 'package:agemo/AgemoPages/couleurs.dart';
import 'package:agemo/AgemoPages/dimensions_pages.dart';
import 'package:agemo/models/produit_model.dart';
import 'package:flutter/material.dart';
import 'produit_detail_bulletin.dart';


class ProduitsItemDetailBulletin extends StatefulWidget {
  ProduitsItemDetailBulletin(this.produitMod, {Key? key}) : super(key: key);
  final ProduitMod produitMod;

  @override
  State<ProduitsItemDetailBulletin> createState() => _ProduitsItemDetailBulletinState();
}

class _ProduitsItemDetailBulletinState extends State<ProduitsItemDetailBulletin> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProduitDetailBulletin(widget.produitMod),
        ),
      ),
      child: Container(
        //padding: EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.only(bottom: 5),
        width: displayWidth(context),
        height: 90,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Container(
                margin: EdgeInsets.all(3),
                width: 80,
                height: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.produitMod.imageProduit,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 3,
            ),
            Container(
                width: displayWidth(context) -110,
                //color: Colors.red,
                height: 88,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: displayWidth(context) -110,
                      height: 48,
                      //color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '${widget.produitMod.numeroProduit.toString()} ${widget.produitMod.nomProduit.toString()}',
                                  style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  widget.produitMod.categorie,
                                  style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular'),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 229, 36, 36),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '${widget.produitMod.prixProduit.toString()} CHF',
                                  style:TextStyle(fontSize: 15, fontFamily: 'LatoBold',color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: displayWidth(context) -135,
                      height: 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                               FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Ref:',
                                  style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular'),
                                ),
                              ),
                              const SizedBox(width: 8,),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  widget.produitMod.refProduit.toString(),
                                  style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
