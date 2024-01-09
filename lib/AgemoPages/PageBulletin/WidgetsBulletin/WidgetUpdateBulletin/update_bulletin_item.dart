import 'package:agemo/AgemoPages/PageBulletin/WidgetsBulletin/WidgetUpdateBulletin/update_detail_bulletin_screen.dart';
import 'package:agemo/AgemoPages/dimensions_pages.dart';
import 'package:flutter/material.dart';
import '../../../../models/bulletin_model.dart';
import '../../../../models/client_model.dart';
import '../../../../models/produit_model.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../couleurs.dart';
import '../detail_bulletin_screen.dart';



class UpdateBulletinItem extends StatefulWidget {
  UpdateBulletinItem(this.bulletinMod, this.produitMod,this.clientMod,{Key? key}) : super(key: key);
  final BulletinMod bulletinMod;
  final ProduitMod produitMod;
  final ClientMod clientMod;

  @override
  State<UpdateBulletinItem> createState() => _UpdateBulletinItemState();
}

class _UpdateBulletinItemState extends State<UpdateBulletinItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => UpdateDetailBulletin(widget.bulletinMod, widget.produitMod),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Container(
          width: displayWidth(context),
          height: 106,
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
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                            widget.bulletinMod.modifBul ? Container(
                              width:40 ,
                              height: 15,
                              decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(8)),
                              child: Center(child: const Text('Modifié', style: TextStyle(fontSize: 9, fontFamily: 'PoppinsRegular',color: Colors.white),)),
                            ): Container()
                          ],
                        ),
                      ),
                      Container(
                        width: displayWidth(context) *0.79,
                        height: 86,
                        //color: Colors.yellow,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
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
                                      // color: Colors.red,
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
