import 'package:agemo/AgemoPages/PagesProduit/WidgetsProduit/image_description.dart';
import 'package:agemo/AgemoPages/dimensions_pages.dart';
import 'package:flutter/material.dart';
import '../../../../models/produit_model.dart';
import 'package:badges/badges.dart' as badges;

import '../../../PageConnexion/WidgetsConnexion/styled_button.dart';
import '../../../PagesProduit/WidgetsProduit/ShowCart/show_cart_screen.dart';
import '../../../PagesProduit/WidgetsProduit/show_dialog_produit.dart';
import '../../../app_bar.dart';
import '../../../couleurs.dart';
import 'tab_bar.dart';

class AjoutProduitDetail extends StatefulWidget {
  const AjoutProduitDetail(this.produitdetail, {super.key});

  final ProduitMod produitdetail;

  @override
  State<AjoutProduitDetail> createState() => _AjoutProduitDetailState();
}

class _AjoutProduitDetailState extends State<AjoutProduitDetail> {
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
            'Produit ajouté ! ',
            "Vous venez d'ajouter",
            "un produit dans la liste. N'oubliez pas de mettre à",
            'jour votre liste de produit en fin de tournée !',
            'FERMER',
            Colors.black,
          );
        });
    updateqte();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Détail produit',
          style: TextStyle(
              fontSize: 15,
              fontFamily: 'LatoBold',
              color: Colors.white
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 229, 36, 36),
        //leading: const Icon(Icons.menu,),
        actions: <Widget>[
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: -1, end: 18),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ShowCartScreen(),
              ),
            ),
            badgeStyle: badges.BadgeStyle(
              badgeColor: greyColor,
              padding: EdgeInsets.all(5),
              // borderRadius: BorderRadius.circular(4),
            ),
            //badgeContent: Text('3', style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            badgeContent: Text(
              _newQte.toString(),
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 17, right: 18),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ShowCartScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 27,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: displayWidth(context),
          height: displayHeight(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                                    style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
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
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ImageDescriptionProduits(widget.produitdetail),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0,left: 8,right: 8),
                  child: Container(
                      width: displayWidth(context),
                      height: displayHeight(context) * 0.29,
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0,left: 8,right: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          width: displayWidth(context),
                          height: displayHeight(context) * 0.11,
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
                                      backgroundColor: appbarColor,
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
                                      backgroundColor: appbarColor,
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
                        padding: const EdgeInsets.only(top: 15),
                        child: StyledButton(
                          text: "Ajouter au panier",
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
      ),
    );
  }
}
