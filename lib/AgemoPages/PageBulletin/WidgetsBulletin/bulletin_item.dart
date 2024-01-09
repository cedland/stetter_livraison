import 'package:agemo/AgemoPages/dimensions_pages.dart';
import 'package:flutter/material.dart';
import '../../../models/bulletin_model.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../models/client_model.dart';
import '../../../models/produit_model.dart';
import '../../couleurs.dart';
import 'detail_bulletin_screen.dart';


class BulletinItem extends StatefulWidget {
  BulletinItem(this.bulletinMod, this.produitMod,this.clientMod,{Key? key}) : super(key: key);
  final BulletinMod bulletinMod;
  final ProduitMod produitMod;
  final ClientMod clientMod;

  @override
  State<BulletinItem> createState() => _BulletinItemState();
}

class _BulletinItemState extends State<BulletinItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailBulletinScreen(widget.bulletinMod, widget.produitMod, widget.clientMod),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Container(
          width: displayWidth(context),
          height: 110,
          //color: Colors.pink,
          child: Card(
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: widget.bulletinMod.statut
                              ? Color.fromARGB(255, 217, 250, 217)
                              : Color.fromARGB(234, 253, 207, 214),
                        ),
                        child: Icon(
                          widget.bulletinMod.statut
                              ? Icons.check_circle
                              : Icons.access_time_rounded,
                          size: 30,
                          color:
                          widget.bulletinMod.statut ? Colors.green : appbarColor,
                        ),
                      ),
                      Container(
                        width: displayWidth(context) *0.79,
                        height: 90,
                        //color: Colors.yellow,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        widget.bulletinMod.numeroBul.toString(),
                                        style:TextStyle(fontSize: 14, fontFamily: 'LatoBold'),
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        '${widget.bulletinMod.nomClient} | ${widget.bulletinMod.codeCommande.toString()}',
                                          style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                                      ),
                                    ),
                                    Container(
                                     //color: Colors.red,
                                      width: 225,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          '${widget.bulletinMod.adresse}',
                                          style:TextStyle(fontSize: 13, fontFamily: 'LatoRegular'),
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        'Qté produits: ${widget.bulletinMod.qteBul}',
                                        style:TextStyle(fontSize: 12, fontFamily: 'LatoRegular'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              //width: 90,
                              child: widget.bulletinMod.statut
                                  ? Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Livré',
                                    style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular',color: Colors.blue),
                                  ),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      widget.bulletinMod.date,
                                      style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                                    ),
                                  ),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      widget.bulletinMod.heure,
                                      style:TextStyle(fontSize: 13, fontFamily: 'LatoRegular'),
                                    ),
                                  ),
                                ],
                              )
                                  : Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  LinearPercentIndicator(
                                    animation: true,
                                    animationDuration: 1000,
                                    width: 90,
                                    lineHeight: 15.0,
                                    percent: 0.7,
                                    backgroundColor: greyColor,
                                    progressColor: appbarColor,
                                    barRadius: const Radius.circular(8),
                                  ),
                                  Text(
                                    'Client absent',
                                    style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular',color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
