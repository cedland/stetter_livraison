import 'package:agemo/AgemoPages/PagesProduit/WidgetsProduit/produits_detail.dart';
import 'package:agemo/AgemoPages/couleurs.dart';
import 'package:flutter/material.dart';
import '../../../models/produit_model.dart';


class ProduitsItem extends StatefulWidget {
  ProduitsItem(this.produitMod, {Key? key}) : super(key: key);
  final ProduitMod produitMod;

  @override
  State<ProduitsItem> createState() => _ProduitsItemState();
}

class _ProduitsItemState extends State<ProduitsItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProduitsDetail(widget.produitMod),
        ),
      ),
      child: Container(
        //padding: EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.only(bottom: 10,left: 4,right: 4),
        width: MediaQuery.of(context).size.width ,
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
              width: 5,
            ),
            Container(
                width: MediaQuery.of(context).size.width - 110,
                height: 84,
                //color: Colors.purple,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 110,
                      //color: Colors.black,
                      height: 44,
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
                                    style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',)
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  widget.produitMod.categorie,
                                    style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',)
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: appbarColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '${widget.produitMod.prixProduit.toString()} CHF',
                                    style: TextStyle(fontSize: 15, fontFamily: 'LatoBold',color: Colors.white)
                              ),
                            ),
                            )
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 110,
                      height: 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Ref:',
                                    style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',)
                                ),
                              ),
                              const SizedBox(width: 8,),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  widget.produitMod.refProduit.toString(),
                                    style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',)
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Stock:',
                                    style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',)
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    widget.produitMod.qteProduit.toString(),
                                      style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',)
                                  ),
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
