import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../models/cart_model.dart';
import '../../../couleurs.dart';
import '../../../dimensions_pages.dart';
import 'package:quickalert/quickalert.dart';

import '../../produit_screen.dart';
import '../../show_dialog_produits.dart';
import 'show_cart_screen.dart';

class ShowCartList extends StatefulWidget {
  const ShowCartList({super.key});

  @override
  State<ShowCartList> createState() => _ShowCartListState();
}

class _ShowCartListState extends State<ShowCartList> {
  String showAlert(String message, Widget confirm){
    QuickAlert.show(
        context: context,
        title: 'succès',
        confirmBtnText: 'OK',
        confirmBtnColor: appbarColor,
        text: message,
        type: QuickAlertType.success
    );
    return message;
  }
  void _showDialogdelete() {
    showDialog(
        context: context,
        builder: (context) {
          return const ShowDialogProduits(
            'Suppression produit',
            'Souhaitez vous vraiment supprimer',
            'ce produit de la liste ?',
          );
        });
    //showAlert('Votre commande a bien été enregistrée !',BulletinScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(builder: (context, value, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            SizedBox(
              width: displayWidth(context),
              height: MediaQuery.of(context).size.height /1.5,
              child: ListView.builder(
                itemCount: value.shopItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Container(
                            margin: EdgeInsets.all(3),
                            width: 90,
                            height: 90,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                value.shopItems[index][0],
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width - 108,
                            height: 96,
                            //      decoration: BoxDecoration(color: Colors.pink),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        value.shopItems[index][2],
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'PoppinsMedium',
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        '${value.shopItems[index][5]} CHF',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'PoppinsRegular',
                                          color: greyColor,

                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.cancel,
                                        size: 14,
                                      ),
                                      onPressed: _showDialogdelete,
                                    ),
                                  ],
                                ),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${value.shopItems[index][7]} | ${value.shopItems[index][3].toString()}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'PoppinsRegular',
                                        color: greyColor,
                                      ),
                                    ),
                                    Spacer(),
                                    ElevatedButton(
                                      onPressed:
                                      value.shopItems[index][4] <= 1
                                          ? null
                                          : () {
                                        setState(() {
                                          value.shopItems[index][4] --;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: appbarColor,
                                        fixedSize: const Size(5, 5),
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
                                          horizontal: 2.0),
                                      child: Text(
                                        value.shopItems[index][4]
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'PoppinsMedium',
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          value.shopItems[index][4] ++;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: appbarColor,
                                        fixedSize: const Size(5, 5),
                                        shape: const CircleBorder(),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                  );
                },
              ),

            ),
            const SizedBox(height: 5,),
            Container(
              margin:
              const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 14,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  const SizedBox(
                    width: 150,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Code Promo',
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            backgroundColor:
                            MaterialStateProperty.all(appbarColor)),
                        onPressed: () {},
                        child: const Text('Appliquer',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'PoppinsRegular'),
                            textAlign: TextAlign.center)),
                  )
                ],
              ),
            ),

            Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Montant total',
                              style: TextStyle(
                                  fontFamily: 'PoppinsMedium', fontSize: 14),
                            ),
                            const Spacer(),
                            Text('(${value.shopItems.length} produits)',
                                style: const TextStyle(
                                    fontFamily: 'PoppinsLight', fontSize: 12)),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              ('${value.calculateTotal()} CHF'),
                              style: const TextStyle(
                                  fontSize: 16, fontFamily: 'PoppinsBold'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: 400,
                          height: 40,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                  ),
                                  backgroundColor:
                                  MaterialStateProperty.all(appbarColor)),
                              onPressed: (){showAlert('Votre commande a bien été enregistrée !',ProduitScreen());},
                              child: const Text('Valider la commande',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'PoppinsRegular'),
                                  textAlign: TextAlign.center)),
                        ),
                      ],
                    ))
              ],
            ),
          ],
        ),
      );
    });
  }
}
