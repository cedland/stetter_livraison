import 'package:agemo/AgemoPages/PagesProduit/WidgetsProduit/image_description.dart';
import 'package:agemo/AgemoPages/dimensions_pages.dart';
import 'package:flutter/material.dart';
import '../../../models/produit_model.dart';
import '../../PageBulletin/WidgetsBulletin/WidgetDetailBulletin/tab_bar.dart';
import '../../app_bar.dart';
import '../../couleurs.dart';
import 'show_dialog_produit.dart';

class ProduitsDetail extends StatefulWidget {
  const ProduitsDetail(this.produitdetail, {super.key});

  final ProduitMod produitdetail;

  @override
  State<ProduitsDetail> createState() => _ProduitsDetailState();
}

class _ProduitsDetailState extends State<ProduitsDetail> {
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
      appBar: CustomAppBar(title: "Détail produit", function: CustomAppBarFunction.back),
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: SizedBox(
          width: displayWidth(context),
          height: displayHeight(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                            style: TextStyle(fontSize: 16, fontFamily: 'LatoBold',),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '${widget.produitdetail.prixProduit.toString()} CHF',
                            style: TextStyle(fontSize: 16, fontFamily: 'LatoBold')
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                          style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',)
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        widget.produitdetail.refProduit.toString(),
                                          style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',)
                                      ),
                                    ),
                                  ],
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                      'La boite',
                                      style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',)
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                        Container(
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 229, 36, 36),
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: ImageDescriptionProduits(widget.produitdetail),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:14),
                  child: Container(
                      width: displayWidth(context),
                      height: displayHeight(context) * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TapBar(widget.produitdetail),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
