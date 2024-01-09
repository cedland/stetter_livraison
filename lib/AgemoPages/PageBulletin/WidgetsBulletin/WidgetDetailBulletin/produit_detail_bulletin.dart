import 'package:agemo/AgemoPages/PagesProduit/WidgetsProduit/image_description.dart';
import 'package:agemo/AgemoPages/dimensions_pages.dart';
import 'package:flutter/material.dart';
import '../../../../models/produit_model.dart';
import '../../../PageConnexion/WidgetsConnexion/styled_button.dart';
import '../../../PagesProduit/WidgetsProduit/show_dialog_produit.dart';
import '../../../app_bar.dart';
import '../../../couleurs.dart';
import 'image_description_produits_bulletin.dart';
import 'showdialog.dart';
import 'tab_bar.dart';

class ProduitDetailBulletin extends StatefulWidget {
  const ProduitDetailBulletin(this.produitdetail, {super.key});

  final ProduitMod produitdetail;

  @override
  State<ProduitDetailBulletin> createState() => _ProduitDetailBulletinState();
}

class _ProduitDetailBulletinState extends State<ProduitDetailBulletin> {
  late int _counter;
  late int _modifQte = 0;
  late int _qteInitiale;
  late int _newQte;

  @override
  void initState() {
    _counter = 1;
    _modifQte = 0;
    _qteInitiale = widget.produitdetail.qteProduit;
    _newQte = _qteInitiale;
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  int updateqte() {
    setState(() {
      _newQte = _newQte + _counter;
    });
    return _newQte;
  }

  void _showDialogajout() {
    showDialog(
        context: context,
        builder: (context) {
          return const ShowDialogProduit(
            'Quantité du produit modifiée ! ',
            "Vous venez de modifier",
            "le nombre de produit. N'oubliez pas de mettre à",
            'jour votre bulletin en fin de tournée !',
            'FERMER',
            Colors.black,
          );
        });
    updateqte();
  }
  void _showDialogdelete() {
    showDialog(
        context: context,
        builder: (context) {
          return const ShowDialog(
            'Suppression produit',
            'Souhaitez vous vraiment supprimer',
            'ce produit du bulletin ?',
          );
        });
    //showAlert('Votre commande a bien été enregistrée !',BulletinScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Détail produit", function: CustomAppBarFunction.back, additionalIcon: Icons.delete,additionalFunction: _showDialogdelete,),
      backgroundColor: Colors.grey.shade50,
      body: SizedBox(
        width: displayWidth(context),
        height: displayHeight(context),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10,top: 10),
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '${widget.produitdetail.numeroProduit.toString()} ${widget.produitdetail.nomProduit}',
                          style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '${widget.produitdetail.prixProduit.toString()} CHF',
                          style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Ref:',
                                  style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),

                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  widget.produitdetail.refProduit.toString(),
                                  style: TextStyle(fontSize: 13, fontFamily: 'LatoRegular'),
                                ),
                              ),
                            ],
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'La boite',
                              style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: appbarColor,
                        ),
                        margin: const EdgeInsets.all(5),
                        child: Container(
                          width: 80,
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          alignment: Alignment.center,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Stock : ${widget.produitdetail.qteProduit}',
                              style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                            ),
                          ),
                        ),
                      ),




                    ],
                  ),
                ],
              ),
              ImageDescriptionProduitsBulletin(widget.produitdetail),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                    width: displayWidth(context),
                    height: displayHeight(context) * 0.25,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child:  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TapBar(widget.produitdetail),
                        ],
                      ),
                    )),
              ), Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(8),
                        width: displayWidth(context),
                        height: displayHeight(context) * 0.105,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(8))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 35.0),
                              child: Text(
                                'Quantité',
                                style:TextStyle(fontSize: 14, fontFamily: 'LatoBold'),
                              ),
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: _counter <= 1
                                      ? null
                                      : _decrementCounter,
                                  style: ElevatedButton.styleFrom(
                                    primary: appbarColor,
                                    fixedSize: const Size(20, 20),
                                    shape: const CircleBorder(),
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Text(
                                    _counter.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: _incrementCounter,
                                  style: ElevatedButton.styleFrom(
                                    primary: appbarColor,
                                    fixedSize: const Size(20, 20),
                                    shape: const CircleBorder(),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: StyledButton(
                        text: 'Mettre à jour Qté',
                        onPressed: _showDialogajout,
                        color: const Color.fromARGB(255, 229, 36, 36),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
