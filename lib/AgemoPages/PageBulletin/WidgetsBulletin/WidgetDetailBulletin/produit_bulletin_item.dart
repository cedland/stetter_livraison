import 'package:agemo/AgemoPages/couleurs.dart';
import 'package:flutter/material.dart';
import '../../../../models/produit_model.dart';
import 'ajout_produit_detail.dart';

class ProduitBulletinItem extends StatefulWidget {
  ProduitBulletinItem(this.produitMod, {Key? key}) : super(key: key);
  final ProduitMod produitMod;

  @override
  State<ProduitBulletinItem> createState() => _ProduitBulletinItemState();
}

class _ProduitBulletinItemState extends State<ProduitBulletinItem> {
  int _cartBadgeAmount = 0;
  final _formkey = GlobalKey<FormState>();
  TextEditingController myController = TextEditingController();

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // <-- SEE HERE
          title:  Center(
              child: Text(
            'Entrer la quantité !',
                style:TextStyle(fontSize: 14, fontFamily: 'LatoBold'),
          )),
          content: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: myController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          //width: 2.0,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty || int.parse(myController.text) ==0 || int.parse(myController.text) <0) {
                        return 'veuillez entrer la quantité du produit';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              var valeur = int.parse(myController.text);
                              print(_cartBadgeAmount);
                              setState(() {
                                _cartBadgeAmount = _cartBadgeAmount + valeur;
                                myController.clear();
                                Navigator.of(context).pop();
                              });
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(appbarColor),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),),),
                          child: Text(
                            'Valider',
                            style:TextStyle(fontSize: 14, fontFamily: 'LatoBold',color: Colors.white),
                          ),

                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.black),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),),),
                            child: Text(
                              'Annuler',
                              style:TextStyle(fontSize: 14, fontFamily: 'LatoBold',color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AjoutProduitDetail(widget.produitMod),
        ),
      ),
      child: Container(
        //padding: EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.only(left: 5, right: 5, bottom: 11),
        width: MediaQuery.of(context).size.width,
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
             //color: Colors.yellow,
                width: MediaQuery.of(context).size.width - 110,
                height: 85,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 123,
                      //color: Colors.pink,
                      height: 45,
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
                                  style:TextStyle(fontSize: 14, fontFamily: 'LatoBold'),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  widget.produitMod.categorie,
                                  style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
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
                                  style:TextStyle(fontSize: 14, fontFamily: 'LatoBold',color: Colors.white),
                              ),
                            ),
                          ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 123,
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
                                  style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  widget.produitMod.refProduit.toString(),
                                  style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: ElevatedButton(
                              onPressed: _showAlertDialog,
                              //onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                fixedSize: const Size(30, 30),
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
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
